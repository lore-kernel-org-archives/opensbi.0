From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 9 Jan 2024 12:16:50 -0800
Subject: [RFC PATCH v2 2/4] lib: sbi: add support for Supervisor Software
 Events extension
In-Reply-To: <20240109104500.2080121-3-cleger@rivosinc.com>
References: <20240109104500.2080121-3-cleger@rivosinc.com>
Message-ID: <ZZ2pss83FEOU4oR1@debug.ba.rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 09, 2024 at 11:44:54AM +0100, Cl?ment L?ger wrote:
>+static int sse_global_init()
>+{
>+	struct sbi_sse_event *e;
>+	unsigned int i, ev = 0;
>+
>+	for (i = 0; i < EVENT_COUNT; i++) {
>+		if (EVENT_IS_GLOBAL(supported_events[i]))
>+			global_event_count++;
>+		else
>+			local_event_count++;
>+	}

nit: through out patch series `global` is used for global events.
Here local event count and global event count both are setup.
Although only global events are initialized.
Perhaps its better to take out event counting from here and put in
sbi_sse_init or function/macro of it's own.


>+
>+	global_events = sbi_zalloc(sizeof(*global_events) * global_event_count);
>+	if (!global_events)
>+		return SBI_ENOMEM;
>+
>+	for (i = 0; i < EVENT_COUNT; i++) {
>+		if (!EVENT_IS_GLOBAL(supported_events[i]))
>+			continue;
>+
>+		e = &global_events[ev];
>+		sse_event_init(e, supported_events[i]);
>+		SPIN_LOCK_INIT(e->lock);
>+
>+		ev++;
>+	}
>+
>+	return 0;
>+}
>+


>-- 
>2.43.0
>

