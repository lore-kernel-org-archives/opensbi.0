From: Inochi Amaoto <inochiama@outlook.com>
Date: Tue, 23 May 2023 18:25:07 +0800
Subject: [PATCH 2/3] platform: generic: thead: separate implement of thead c9xx pmu
In-Reply-To: <CAJF2gTT==Bbtq49O-WPMD2reRo8nd7rEBcM6VwCeMmu91VbDKg@mail.gmail.com>
References: <CAJF2gTT==Bbtq49O-WPMD2reRo8nd7rEBcM6VwCeMmu91VbDKg@mail.gmail.com>
Message-ID: <IA1PR20MB495316837A60C9FD4C76372EBB409@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Which linux patch series you've tesed with? Thx
>
> Could give out your test branch, we could help test.

Only the third patch is only apply to th1520.

And this patch only separate some c9xx code from d1 which mentioned in
commit b6e520b2a836cd7cc8dc99c25a21a470e8589888.
So any of c906 boards can be used for testing. And you can test with
mainline kernel.

The pmu dtb node can be obtains from
https://lore.kernel.org/linux-perf-users/IA1PR20MB4953FCC20C89F2659EB34896BB7F9 at IA1PR20MB4953.namprd20.prod.outlook.com/T/#t

The example dtb node can be used on both th1520 and Sophgo mango. If you need
to test on c906, just use the first few events which is mentioned in the mail.

