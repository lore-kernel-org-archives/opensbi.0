From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 18 Feb 2022 09:12:07 +0530
Subject: riscv_encoding.h: double definition upon integration with other
 projects
In-Reply-To: <CAA5uK6JjGK2m-aRw-yi1KV9LkAay0BNisjyAxxfZp4uit9+-_Q@mail.gmail.com>
References: <CAA5uK6JjGK2m-aRw-yi1KV9LkAay0BNisjyAxxfZp4uit9+-_Q@mail.gmail.com>
Message-ID: <CAK9=C2V5VP9yKyi+SXvBorYqVMqf5zaLuJ4bTJ00mg9_CCMhkw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 18, 2022 at 3:02 AM Petro Karashchenko
<petro.karashchenko@gmail.com> wrote:
>
> Hello,
>
> Recently the opensbi support was added to Apache NuttX project. But
> the integration didn't pass cleanly and currently require few
> workarounds to eliminate dozens of warnings. The reason for this is
> that internal NuttX header files have defines with the same names that
> are available in
> https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv_encoding.h
>
> I want to ask the OpenSBI team for advice on what can be an optimal
> solution for such types of issues? Can we add "#ifndef" wrapper for
> defines in "riscv_encoding.h" so there will be no redefinition
> warnings or add "OPENSBI_" prefix? Do you see this as a reasonable
> solution?

We can't keep adding prefixes for such things in OpenSBI. The
defines in riscv_encoding.h are RISC-V spec details and I don't
see why we should add OpenSBI specific prefix to these defines.

Rather, I would suggest the NuttX project to remove the duplicate
defines which are already available in sbi/riscv_encoding.h.

For example, the <nuttx>/arch/risc-v/include/csr.h can include
sbi/riscv_encoding.h and remove the conflicting defines.

Regards,
Anup

>
> Best regards,
> Petro
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

