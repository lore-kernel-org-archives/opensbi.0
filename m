From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 May 2022 09:51:59 +0530
Subject: [RFC PATCH 0/2] HSM implementation for Allwinner D1
In-Reply-To: <20220506065722.27357-1-samuel@sholland.org>
References: <20220506065722.27357-1-samuel@sholland.org>
Message-ID: <CAK9=C2VvRbjkPCPknjO0w=jCUNodP0VMZutbeFX9=13_aaaggw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Samuel,

On Fri, May 6, 2022 at 12:27 PM Samuel Holland <samuel@sholland.org> wrote:
>
> This series adds a minimal working HSM implementation for the Allwinner
> D1 SoC. It works with the Linux sbi_cpuidle driver. Even with canned
> values for entry/exit latency, I am seeing 30-45 mW reduction in power
> usage at idle.
>
> Since this is the first HSM driver submission, there is no example to
> follow. I have some questions in my commit message, and some extra
> commentary in the code to explain what is going on. Comments welcome!
>
> Regards,
> Samuel
>
>
> Samuel Holland (2):
>   lib: sbi_hsm: Call a device hook during hart resume
>   platform: Add HSM implementation for Allwinner D1

Please rebase your v2 on the latest OpenSBI since the compile-time
C array support is already available in the latest OpenSBI.

Thanks,
Anup

>
>  include/sbi/sbi_hsm.h        |   8 ++
>  lib/sbi/sbi_hsm.c            |   8 ++
>  platform/generic/objects.mk  |   1 +
>  platform/generic/platform.c  |   2 +
>  platform/generic/sun20i_d1.c | 225 +++++++++++++++++++++++++++++++++++
>  5 files changed, 244 insertions(+)
>  create mode 100644 platform/generic/sun20i_d1.c
>
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

