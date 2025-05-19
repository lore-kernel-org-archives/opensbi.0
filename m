Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4714C3ABC9
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C2MkYqYFfVophvMRRzgK+MuPTFyqimONx/t0N8ZSgo=; b=FL2DB2n936d+f2akwLWAa0EZo9
	9EuFZrfaTt6vCHcv4vK9xt70igSrn/do8N0PTja2GW3md1eSqu6Kzf+TeahZZvOJoPC2EfYu/V6Hy
	FxeVGKtWsW9CmZc7XdIDhEOOnLjsaiRlsN/OYGlbvdyhxyLvO5N7v6uNRhUpC7V8wObu6D/IVHuz3
	EXMESnq40i/YkqWPrYapqPPFdEejg14UGlW3UkujcZmoMwuwsrx2t0DCZdyznhBNJ13XOMS306bsx
	WnGORiGKUAeZpi4uwSTzAoMvAaa8N4b8fe0TH//fgOpNmeAL/soM8EUpZ7B73r3LUcTcW2XquDF6y
	7sgwMSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpcy-00000007nuJ-1imf;
	Mon, 19 May 2025 01:49:16 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGpcv-00000007nr5-3KZo
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 01:49:15 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54J1n1xL027161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 09:49:01 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 19 May 2025
 09:49:01 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <mail@yclin.org>
CC: <opensbi@lists.infradead.org>, <alvinga@andestech.com>
Subject: [PATCH] lib: utils: Initial compiler built-in stack protector support
Date: Mon, 19 May 2025 09:48:56 +0800
Message-ID: <20250519014856.2978228-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503161938.646908-1-alvinga@andestech.com>
References: <20250503161938.646908-1-alvinga@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54J1n1xL027161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_184914_169499_8F965188 
X-CRM114-Status: GOOD (  29.48  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8549388536785974109=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============8549388536785974109==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Hi Yu-Chien,=0D
=0D
> -----Original Message-----=0D
> From: Yu-Chien Lin <mail@yclin.org>=0D
> Sent: Wednesday, May 7, 2025 10:35 PM=0D
> To: opensbi@lists.infradead.org; Alvin Che-Chia Chang(=E5=BC=B5=E5=93=B2=
=E5=98=89)=0D
> <alvinga@andestech.com>=0D
> Subject: Re: [PATCH] lib: utils: Initial compiler built-in stack =0D
> protector support=0D
> =0D
> [EXTERNAL MAIL]=0D
> =0D
> Hi Alvin,=0D
> =0D
> I encountered an issue when building with DEBUG=3D1 and =0D
> CONFIG_STACK_PROTECTOR_ALL=3Dy. An exception occurs at the=0D
> __check_csr_64 macro which calls sbi_hart_expected_trap_addr().=0D
> Not sure the root cause but here's a workaround that disables stack =0D
> protection specifically for this function:=0D
> =0D
> + #pragma GCC push_options=0D
> + #pragma GCC optimize ("no-stack-protector")=0D
> static inline ulong sbi_hart_expected_trap_addr(void) {=0D
>    return (ulong)sbi_hart_expected_trap; }=0D
> + #pragma GCC pop_options=0D
> =0D
> Regards,=0D
> Peter Lin=0D
=0D
Thanks for reporting this issue.=0D
The root cause is that when OpenSBI is compiled with -O0 optimization level=
,=0D
the sbi_hart_expected_trap_addr() in the following code block becomes a "re=
gular function call" rather than "inline function":=0D
=0D
    #define csr_read_allowed(csr_num, trap)                                =
 \=0D
            ({                                                             =
 \=0D
            register ulong tinfo asm("a3") =3D (ulong)trap;                =
   \=0D
            register ulong ttmp asm("a4");                                 =
 \=0D
            register ulong mtvec =3D sbi_hart_expected_trap_addr();        =
   \=0D
            register ulong ret =3D 0;                                      =
   \=0D
            ((struct sbi_trap_info *)(trap))->cause =3D 0;                 =
   \=0D
            asm volatile(                                                  =
 \=0D
                    "add %[ttmp], %[tinfo], zero\n"                        =
 \=0D
                    "csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"       =
 \=0D
                    "csrr %[ret], %[csr]\n"                                =
 \=0D
                    "csrw " STR(CSR_MTVEC) ", %[mtvec]"                    =
 \=0D
                : [mtvec] "+&r"(mtvec), [tinfo] "+&r"(tinfo),              =
 \=0D
                  [ttmp] "+&r"(ttmp), [ret] "=3D&r" (ret)                  =
   \=0D
                : [csr] "i" (csr_num)                                      =
 \=0D
                : "memory");                                               =
 \=0D
            ret;                                                           =
 \=0D
            })                                                             =
 \=0D
=0D
When compiling OpenSBI with -O0 and -fstack-protector-all:=0D
Compiler uses register a3 in sbi_hart_expected_trap_addr() to check the sta=
ck guard variable.=0D
However, register a3 is not preserved when calling sbi_hart_expected_trap_a=
ddr(), so a3 is clobbered by sbi_hart_expected_trap_addr().=0D
=0D
		val =3D csr_read_allowed(CSR_TSELECT, &trap);=0D
    6dae:	fb040793          	addi	a5,s0,-80=0D
    6db2:	86be                	mv	a3,a5=0D
    6db4:	af5ff0ef          	jal	68a8 <sbi_hart_expected_trap_addr>=0D
    6db8:	84aa                	mv	s1,a0=0D
    6dba:	fa043823          	sd	zero,-80(s0)=0D
    6dbe:	87a6                	mv	a5,s1=0D
    6dc0:	00068733          	add	a4,a3,zero=0D
    6dc4:	305797f3          	csrrw	a5,mtvec,a5=0D
    6dc8:	7a002673          	csrr	a2,tselect=0D
    6dcc:	30579073          	csrw	mtvec,a5=0D
    6dd0:	8932                	mv	s2,a2=0D
    6dd2:	87ca                	mv	a5,s2=0D
    6dd4:	f8f43023          	sd	a5,-128(s0)=0D
=0D
=0D
In addition to the workaround you provided, there are two workarounds I fou=
nd:=0D
1. Instead of calling sbi_hart_expected_trap_addr(), we can directly cast s=
bi_hart_expected_trap since it is extern variable.=0D
    - register ulong mtvec =3D sbi_hart_expected_trap_addr();=0D
    + register ulong mtvec =3D (ulong)sbi_hart_expected_trap;=0D
=0D
2. Reorder sbi_hart_expected_trap_addr() before using a3:=0D
=0D
	register ulong mtvec =3D sbi_hart_expected_trap_addr();		\=0D
	register ulong tinfo asm("a3") =3D (ulong)trap;			\=0D
	register ulong ttmp asm("a4");=0D
=0D
=0D
I am not sure which workaround is the best one.=0D
Maybe there are better solutions which I am not aware of.=0D
Need other reviewer's comments.=0D
=0D
=0D
Regards,=0D
Alvin Chang=0D
=0D
> =0D
> On 5/4/25 12:19 AM, Alvin Chang wrote:=0D
> > Add stack_protector.c which defines the stack guard variable and the =0D
> > function which will be referenced by compiler built-in stack protector.=
=0D
> >=0D
> > This patch just try to support stack-protector so the value of the =0D
> > stack guard variable is simply fixed for now. It could be improved =0D
> > by deriving from a random number generator, such as Zkr extension or =0D
> > any platform-specific random number sources.=0D
> >=0D
> > Introduce three configurations for the stack protector:=0D
> > 1. CONFIG_STACK_PROTECTOR to enable the stack protector feature by=0D
> >     providing "-fstack-protector" compiler flag 2.=0D
> > CONFIG_STACK_PROTECTOR_STRONG to provide "-fstack-protector-strong"=0D
> > 3. CONFIG_STACK_PROTECTOR_ALL to provide "-fstack-protector-all"=0D
> >=0D
> > Instead of fixing the compiler flag of stack-protector feature as =0D
> > "-fstack-protector", we derive it from the introduced Kconfig =0D
> > configurations. The compiler flag "stack-protector-cflags-y" is =0D
> > defined as Makefile "immediately expanded variables" with ":=3D". =0D
> > Thus, the stronger configuration of the stack protector can =0D
> > overwrite the preceding one.=0D
> >=0D
> > Signed-off-by: Alvin Chang <alvinga@andestech.com>=0D
> > ---=0D
> >   Makefile                                    |  3 ++-=0D
> >   lib/utils/Kconfig                           |  2 ++=0D
> >   lib/utils/stack_protector/Kconfig           | 28=0D
> +++++++++++++++++++++=0D
> >   lib/utils/stack_protector/objects.mk        | 18 +++++++++++++=0D
> >   lib/utils/stack_protector/stack_protector.c | 18 +++++++++++++=0D
> >   5 files changed, 68 insertions(+), 1 deletion(-)=0D
> >   create mode 100644 lib/utils/stack_protector/Kconfig=0D
> >   create mode 100644 lib/utils/stack_protector/objects.mk=0D
> >   create mode 100644 lib/utils/stack_protector/stack_protector.c=0D
> >=0D
> > diff --git a/Makefile b/Makefile=0D
> > index e90836c..eae6d16 100644=0D
> > --- a/Makefile=0D
> > +++ b/Makefile=0D
> > @@ -360,7 +360,7 @@ GENFLAGS  +=3D      $(libsbiutils-genflags-y)=0D
> >   GENFLAGS    +=3D      $(platform-genflags-y)=0D
> >   GENFLAGS    +=3D      $(firmware-genflags-y)=0D
> >=0D
> > -CFLAGS               =3D       -g -Wall -Werror -ffreestanding -nostdl=
ib=0D
> -fno-stack-protector -fno-strict-aliasing -ffunction-sections =0D
> -fdata-sections=0D
> > +CFLAGS               =3D       -g -Wall -Werror -ffreestanding=0D
> -nostdlib -fno-strict-aliasing -ffunction-sections -fdata-sections=0D
> >   CFLAGS              +=3D      -fno-omit-frame-pointer=0D
> -fno-optimize-sibling-calls=0D
> >   # Optionally supported flags=0D
> >   ifeq ($(CC_SUPPORT_VECTOR),y)=0D
> > @@ -379,6 +379,7 @@ CFLAGS            +=3D      $(GENFLAGS)=0D
> >   CFLAGS              +=3D      $(platform-cflags-y)=0D
> >   CFLAGS              +=3D      -fPIE -pie=0D
> >   CFLAGS              +=3D      $(firmware-cflags-y)=0D
> > +CFLAGS               +=3D      $(stack-protector-cflags-y)=0D
> >=0D
> >   CPPFLAGS    +=3D      $(GENFLAGS)=0D
> >   CPPFLAGS    +=3D      $(platform-cppflags-y)=0D
> > diff --git a/lib/utils/Kconfig b/lib/utils/Kconfig index=0D
> > 901ba56..40e5633 100644=0D
> > --- a/lib/utils/Kconfig=0D
> > +++ b/lib/utils/Kconfig=0D
> > @@ -26,6 +26,8 @@ source "$(OPENSBI_SRC_DIR)/lib/utils/reset/Kconfig"=0D
> >=0D
> >   source "$(OPENSBI_SRC_DIR)/lib/utils/serial/Kconfig"=0D
> >=0D
> > +source "$(OPENSBI_SRC_DIR)/lib/utils/stack_protector/Kconfig"=0D
> > +=0D
> >   source "$(OPENSBI_SRC_DIR)/lib/utils/suspend/Kconfig"=0D
> >=0D
> >   source "$(OPENSBI_SRC_DIR)/lib/utils/sys/Kconfig"=0D
> > diff --git a/lib/utils/stack_protector/Kconfig=0D
> > b/lib/utils/stack_protector/Kconfig=0D
> > new file mode 100644=0D
> > index 0000000..c1fee19=0D
> > --- /dev/null=0D
> > +++ b/lib/utils/stack_protector/Kconfig=0D
> > @@ -0,0 +1,28 @@=0D
> > +# SPDX-License-Identifier: BSD-2-Clause=0D
> > +=0D
> > +menu "Stack Protector Support"=0D
> > +=0D
> > +config STACK_PROTECTOR=0D
> > +     bool "Stack Protector buffer overflow detection"=0D
> > +     default n=0D
> > +     help=0D
> > +       This option turns on the "stack-protector" compiler feature.=0D
> > +=0D
> > +config STACK_PROTECTOR_STRONG=0D
> > +     bool "Strong Stack Protector"=0D
> > +     depends on STACK_PROTECTOR=0D
> > +     default n=0D
> > +     help=0D
> > +       Turn on the "stack-protector" with "-fstack-protector-strong"=0D
> option.=0D
> > +       Like -fstack-protector but includes additional functions to be=
=0D
> > +       protected.=0D
> > +=0D
> > +config STACK_PROTECTOR_ALL=0D
> > +     bool "Almighty Stack Protector"=0D
> > +     depends on STACK_PROTECTOR=0D
> > +     default n=0D
> > +     help=0D
> > +       Turn on the "stack-protector" with "-fstack-protector-all" opti=
on.=0D
> > +       Like -fstack-protector except that all functions are protected.=
=0D
> > +=0D
> > +endmenu=0D
> > diff --git a/lib/utils/stack_protector/objects.mk=0D
> > b/lib/utils/stack_protector/objects.mk=0D
> > new file mode 100644=0D
> > index 0000000..d7563e3=0D
> > --- /dev/null=0D
> > +++ b/lib/utils/stack_protector/objects.mk=0D
> > @@ -0,0 +1,18 @@=0D
> > +#=0D
> > +# SPDX-License-Identifier: BSD-2-Clause # # Copyright (c) 2025 =0D
> > +Andes Technology Corporation # # Authors:=0D
> > +#   Alvin Chang <alvinga@andestech.com>=0D
> > +#=0D
> > +=0D
> > +libsbiutils-objs-$(CONFIG_STACK_PROTECTOR) +=3D =0D
> > +stack_protector/stack_protector.o=0D
> > +=0D
> > +ifeq ($(CONFIG_STACK_PROTECTOR),y)=0D
> > +stack-protector-cflags-$(CONFIG_STACK_PROTECTOR) :=3D =0D
> > +-fstack-protector=0D
> > +stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_STRONG) :=3D =0D
> > +-fstack-protector-strong=0D
> > +stack-protector-cflags-$(CONFIG_STACK_PROTECTOR_ALL) :=3D =0D
> > +-fstack-protector-all else stack-protector-cflags-y :=3D =0D
> > +-fno-stack-protector endif=0D
> > diff --git a/lib/utils/stack_protector/stack_protector.c=0D
> > b/lib/utils/stack_protector/stack_protector.c=0D
> > new file mode 100644=0D
> > index 0000000..3088421=0D
> > --- /dev/null=0D
> > +++ b/lib/utils/stack_protector/stack_protector.c=0D
> > @@ -0,0 +1,18 @@=0D
> > +/*=0D
> > + * SPDX-License-Identifier: BSD-2-Clause=0D
> > + *=0D
> > + * Copyright (c) 2025 Andes Technology Corporation=0D
> > + *=0D
> > + * Authors:=0D
> > + *   Alvin Chang <alvinga@andestech.com>=0D
> > + */=0D
> > +=0D
> > +#include <sbi/sbi_console.h>=0D
> > +#include <sbi/sbi_types.h>=0D
> > +=0D
> > +void *__stack_chk_guard =3D (void *)0x95B5FF5AUL;=0D
> > +=0D
> > +void __noreturn __stack_chk_fail(void) {=0D
> > +     sbi_panic("Stack corruption detected\n"); }=0D


--===============8549388536785974109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============8549388536785974109==--
