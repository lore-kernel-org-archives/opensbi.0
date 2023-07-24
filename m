From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Jul 2023 09:17:47 +0530
Subject: v1.3.1 tag is not present in any branch
In-Reply-To: <87h6pxz1dj.fsf@wireframe>
References: <87h6pxz1dj.fsf@wireframe>
Message-ID: <CAAhSdy3Xjt-616YS93XsvM0PA3v2LgM99Ur0r_e9xopE=bhVEA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 22, 2023 at 6:38?AM Vagrant Cascadian <vagrant@debian.org> wrote:
>
> As seen on IRC and github issues:
>
>   https://github.com/riscv-software-src/opensbi/issues/316
>
> There does not appear to be a branch that contains v1.3.1, which makes
> it rather complicated to actually fetch the tag.
>
>   https://github.com/riscv-software-src/opensbi/tree/v1.3.1
>
>   This commit does not belong to any branch on this repository, and may belong to a fork outside of the repository.
>
> Please push a 1.3.x branch or some such with the tag!

I had pushed release-1.3.1 branch two days back since few
folks (including yourself) reported this issue.

This is the first time that we did an intermediate release so
going forward I will ensure that a separate branch in pushed
for an intermediate releases whenever intermediate release
has a different commit history compared to master branch.

Thanks,
Anup


>
> live well,
>   vagrant
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

