From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 11 Dec 2022 13:11:46 +0100
Subject: [PATCH v3 1/5] lib: utils/irqchip: plic: Fix the off-by-one
 error in priority save/restore helpers
In-Reply-To: <CAEUhbmWJCB=i7OkeCMvtz0ut9xcCjiO8fTQ379GZWU=vHuzhwg@mail.gmail.com>
	(Bin Meng's message of "Sun, 11 Dec 2022 18:18:07 +0800")
References: <20221211065424.806478-1-bmeng@tinylab.org>
	<87a63ufe4a.fsf@linux-m68k.org>
	<CAEUhbmWJCB=i7OkeCMvtz0ut9xcCjiO8fTQ379GZWU=vHuzhwg@mail.gmail.com>
Message-ID: <87v8miqgvx.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 11 2022, Bin Meng wrote:

> I added function parameter descriptions in patch 2 to make it crystal
> clear, that the priority array needs to include interrupt source 0.

It should say that the array size must be one more than the maximum
number of sources.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

