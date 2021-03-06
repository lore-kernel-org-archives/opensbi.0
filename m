From: Anup Patel <anup@brainfault.org>
Date: Sat, 6 Mar 2021 17:49:07 +0530
Subject: SBI spec: return code for non-available extension
In-Reply-To: <d9edc754-1153-1de8-f6ff-f1d106d17cba@gmx.de>
References: <d9edc754-1153-1de8-f6ff-f1d106d17cba@gmx.de>
Message-ID: <CAAhSdy1ZaYcVTbr5_VCk9tAGOwXwkiwK+wJif0U2z4rfYaN29Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 6, 2021 at 12:33 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Software may by fault invoke an extension which is not available.
>
> OpenSBI actually returns SBI_ERR_NOT_SUPPORTED from sbi_ecall_handler()
> in this case.
>
> This is a reasonable choice but I could not find any basis in the SBI
> specification. The handling of an ecall for an unsupported EID is not
> described.

The SBI_ERR_NOT_SUPPORTED error code is the default error code
any unsupported function. This should be clearly mentioned in the
SBI base extension if it is not already mentioned.

>
> I think this gap should be closed in the spec.

Totally agree.

Please go ahead and send a patch (or Github PR) for SBI spec.
(Refer, https://github.com/riscv/riscv-sbi-doc)

Our mailing for SBI spec is the UnixPlatformSpec mailing list but
you need to join RiSC-V International as an individual to join the
mailing list (https://lists.riscv.org/g/tech-unixplatformspec).
(Note: AFAIK individual membership is free for RISC-V international).

Regards,
Anup

>
> Best regards
>
> Heinrich
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

