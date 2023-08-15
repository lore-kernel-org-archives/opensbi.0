From: Andreas Schwab <schwab@suse.de>
Date: Tue, 15 Aug 2023 09:17:50 +0200
Subject: [PATCH] Makefile: Force GNU hashing
In-Reply-To: <5c1b000b-1d82-bdfb-9a9f-85edc56ad825@ventanamicro.com> (Jeff
	Law's message of "Mon, 14 Aug 2023 11:26:06 -0600")
References: <20230814043959.390101-1-mchitale@ventanamicro.com>
	<mvmwmxydqbn.fsf@suse.de>
	<5c7a4dce-60fe-e61f-1596-20378d5204d1@ventanamicro.com>
	<mvmil9hdb5a.fsf@suse.de>
	<2c6d3c9c-d0b4-f00a-e3c9-68df02c9d22d@ventanamicro.com>
	<mvmedk5datb.fsf@suse.de>
	<5c1b000b-1d82-bdfb-9a9f-85edc56ad825@ventanamicro.com>
Message-ID: <mvm5y5gdba9.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If they want GNU hashing, they should configure the linker accordingly,
instead of forcing their policy to everyone else.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

