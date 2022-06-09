From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 9 Jun 2022 17:43:33 +0530
Subject: [PATCH 0/3] Fixes for tval/tinst when using sbi_trap_redirect()
In-Reply-To: <TYYP286MB1439D89DE7AF6803C451904FC6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <CAK9=C2Uk=e4Hv=_VwWL9k0S=aNj450R=JNQUx-wbwFDwHS3heg@mail.gmail.com> <TYYP286MB1439D89DE7AF6803C451904FC6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAK9=C2XWsE8Rzb3YHUE3a5Js2448v0S5qUS0m3Y--E798qe=Gg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 9, 2022 at 5:36 PM dram <dramforever@live.com> wrote:
>
>
> >> Note that these patches are *UNTESTED*.
> >>
> >> - For the htinst fixes, no current implementation (QEMU or Spike) of the
> >>   hypervisor extension writes mtinst/htinst to non-zero values, so the
> >>   code paths are unused.
> > Can you test this series with QEMU nested virtualization fixes which
> > include mtinst/htinst emulation ?
> > https://lore.kernel.org/all/20220609033011.752714-1-apatel at ventanamicro.com/
> I just realized that QEMU does not raise misaligned exceptions, so even with
> these patches we still couldn't test the sbi_misaligned_*() patch. Do you have
> suggestions on how we can test misaligned load/store emulation?

Spike does raise misaligned load/store exceptions so we need to add
htinst/mtinst support in Spike to test this.

Regards,
Anup

>
>

