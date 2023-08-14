From: Andreas Schwab <schwab@suse.de>
Date: Mon, 14 Aug 2023 09:40:44 +0200
Subject: [PATCH] Makefile: Force GNU hashing
In-Reply-To: <20230814043959.390101-1-mchitale@ventanamicro.com> (Mayuresh
	Chitale's message of "Mon, 14 Aug 2023 10:09:59 +0530")
References: <20230814043959.390101-1-mchitale@ventanamicro.com>
Message-ID: <mvmwmxydqbn.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Aug 14 2023, Mayuresh Chitale wrote:

> The Yocto QA step verifies that binaries and DSOs use DT_GNU_HASH rather than
> DT_HASH. If the linker is called directly, then we need to make sure to pass in
> the hashing style.

Why does it matter?  The ultimate output is a flat binary.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

