From: dram <dramforever@live.com>
Date: Thu, 9 Jun 2022 20:06:13 +0800
Subject: [PATCH 0/3] Fixes for tval/tinst when using sbi_trap_redirect()
In-Reply-To: <CAK9=C2Uk=e4Hv=_VwWL9k0S=aNj450R=JNQUx-wbwFDwHS3heg@mail.gmail.com>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <CAK9=C2Uk=e4Hv=_VwWL9k0S=aNj450R=JNQUx-wbwFDwHS3heg@mail.gmail.com>
Message-ID: <TYYP286MB1439D89DE7AF6803C451904FC6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


>> Note that these patches are *UNTESTED*.
>>
>> - For the htinst fixes, no current implementation (QEMU or Spike) of the
>>   hypervisor extension writes mtinst/htinst to non-zero values, so the
>>   code paths are unused.
> Can you test this series with QEMU nested virtualization fixes which
> include mtinst/htinst emulation ?
> https://lore.kernel.org/all/20220609033011.752714-1-apatel at ventanamicro.com/
I just realized that QEMU does not raise misaligned exceptions, so even with
these patches we still couldn't test the sbi_misaligned_*() patch. Do you have
suggestions on how we can test misaligned load/store emulation?



