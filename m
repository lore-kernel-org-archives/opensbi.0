Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6674ED26D70
	for <opensbi@archiver.kernel.org>; Fri,  9 Jan 2026 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft7NhTppzReNBuo3tdAdqT4LHVecTVbFTZMe3VIxrp4=; b=rTsCs87Ngh1/bbJaP5mQWGtUFG
	uu2LHvD/I/wOg7PhU3/HIK2zC+sXJEMlYFEmJhMsYGJXtQmtg1HQ2ii1GVMxS2dWMG7tYMfebrQmC
	geA0MEqNYxRYO1no79ZEFeZKIIVC9T6W2aRLD+bRljIebdf1Ao8BosD9kWhBq96wjc8zsnseGcAFD
	NV7D/s7Swoueu/HR4/NUj90+8GQAtb5UGHObzx7MutJ8SJYCxVDxM2ERVw4u2Ee3FnUL7Nu3KY43x
	N1a6GZ3ZIEWF2WQAYje01uAxPMFO99jPyWo+eaPr3dN8D74OfoKn+DHqO257fUkI370RqIAqTz4Gr
	Z7BUeNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF0M-00000002YTl-48Fa;
	Fri, 09 Jan 2026 16:06:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF0J-00000002YTK-1bi4
	for opensbi@lists.infradead.org;
	Fri, 09 Jan 2026 16:06:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8CCF61A274B;
	Fri,  9 Jan 2026 16:06:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 60388606C6;
	Fri,  9 Jan 2026 16:06:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 270FF103C8022;
	Fri,  9 Jan 2026 17:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767974777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=ShWH7BwspfSgkQ0v1/qUrKtL/UolpiTi1IouW47V3mQ=;
	b=RnA6HmjEpDtJFbYG5wi2TCHIqJGQfn3kvYSJK2dCV6ad71woixAbPiQpQAPNlXOe6JW+Cb
	gyPU+pK3NmlLl1EHW4vA7nTPU1/CpYgEXgCfNisq/6SUdhDU9/yCNIig9yYjAL2g0azMNr
	CeR67Jfpm4d/GV1ObtpdplSR9QvCNQi8G0NqJ8SM0Spd6Y6N6q0I+qDyD0BycTAOtwAHEs
	Ds20Q71eUuaIBmA6RXfOeUPjaRkllGDpBkFNUGzSPL2xwXR9pzNJXfV4L6tfv+/Ku3Aw4k
	NCHqLG0Y68ayCg9xAeucgk64/r0CUrzipiw5uLRWn5xXn+sz2KYXQzHo7TtCpg==
Message-ID: <c73ff90194ff3bac49bb4226cb33c97173c652f5.camel@bootlin.com>
Subject: Re: Hart isolation configuration failure (error -3) with OpenSBI
 1.8 on QEMU 10.1.3 rva22s64/rva23s64 profiles
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Anup Patel <apatel@ventanamicro.com>, Daniel Henrique Barboza
	 <daniel.barboza@oss.qualcomm.com>
Cc: thomas.perrot@bootlin.com, Anup Patel <anup@brainfault.org>, Xiang W	
 <wxjstz@126.com>, OpenSBI <opensbi@lists.infradead.org>,
 qemu-riscv@nongnu.org
Date: Fri, 09 Jan 2026 17:06:12 +0100
In-Reply-To: <CAK9=C2W0x4Ut6WFJxvsSwhA8mM8_JUCQCYWvL5Cx+d-BaBY5Zg@mail.gmail.com>
References: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
	 <ee3a8b0fe02eb882cfbb312e80d0694a2e964e76.camel@126.com>
	 <c7901a6dfcedb10a1002d8874a1fd54cb2b58edf.camel@bootlin.com>
	 <CAAhSdy3tzMsF_8gNxRZgCP5TBENTSpw+WpA1C=tZ08OtDNKRcg@mail.gmail.com>
	 <632a9235-f727-4b0d-9698-1f8bbdf3be60@oss.qualcomm.com>
	 <CAK9=C2W0x4Ut6WFJxvsSwhA8mM8_JUCQCYWvL5Cx+d-BaBY5Zg@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_080623_692736_1FF34347 
X-CRM114-Status: GOOD (  29.98  )
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
Content-Type: multipart/mixed; boundary="===============0414289258919107439=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org


--===============0414289258919107439==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xGGE0UGeN3ENBr+e+oL8"


--=-xGGE0UGeN3ENBr+e+oL8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2026-01-08 at 20:34 +0530, Anup Patel wrote:
> On Thu, Jan 8, 2026 at 7:12=E2=80=AFPM Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
> >=20
> >=20
> >=20
> > On 1/8/2026 10:33 AM, Anup Patel wrote:
> > > Hi Thomas,
> > >=20
> > > On Wed, Jan 7, 2026 at 3:02=E2=80=AFPM Thomas Perrot
> > > <thomas.perrot@bootlin.com> wrote:
> > > >=20
> > > > Hello Xiang,
> > > >=20
> > > > On Wed, 2026-01-07 at 10:48 +0800, Xiang W wrote:
> > > > > =E5=9C=A8 2026-01-05=E4=B8=80=E7=9A=84 18:42 +0100=EF=BC=8CThomas=
 Perrot=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > Hello,
> > > > > >=20
> > > > > > Happy New Year!
> > > > > >=20
> > > > > > I'm facing a hart isolation configuration error when
> > > > > > running
> > > > > > OpenSBI
> > > > > > 1.8 on QEMU 10.1.3 with the RISC-V application profiles
> > > > > > rva22s64
> > > > > > and
> > > > > > rva23s64:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 init_coldboot: hart isolation configur=
e failed (error
> > > > > > -3)
> > > > > >=20
> > > > > > No issue occurs when using the rv64 profile. The system
> > > > > > continues
> > > > > > to
> > > > > > boot after the error, but I'd like to understand the root
> > > > > > cause.
> > > > > >=20
> > > > > > I haven't tested OpenSBI 1.8 on real hardware yet - that's
> > > > > > my next
> > > > > > step.
> > > > > >=20
> > > > > > Is there a known QEMU issue? Is there a recommended
> > > > > > workaround
> > > > > > besides
> > > > > > using rv64?
> > > > > >=20
> > > > > > Below is the complete trace:
> > > > > >=20
> > > > > > qemu-system-riscv64 -device virtio-net-
> > > > > > device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
> > > > > > user,id=3Dnet0,hostfwd=3Dtcp:127.0.0.1:2222-
> > > > > > :22,hostfwd=3Dtcp:127.0.0.1:2323-
> > > > > > :23,tftp=3D/src/build/tmp/deploy/images/qemuriscv64 -object
> > > > > > rng-
> > > > > > random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-
> > > > > > pci,rng=3Drng0 -
> > > > > > drive
> > > > > > id=3Ddisk0,file=3D/src/build/tmp/deploy/images/qemuriscv64/core
> > > > > > -
> > > > > > image-minimal-qemuriscv64.rootfs-
> > > > > > 20260105173847.ext4,if=3Dnone,format=3Draw
> > > > > > -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -
> > > > > > device
> > > > > > usb-
> > > > > > tablet -device usb-kbd=C2=A0 -machine virt -cpu rva23s64 -smp 4
> > > > > > -m 256 -
> > > > > QEMU disables PMP by default; the following option needs to
> > > > > be added.
> > > > >=20
> > > > > -cpu rva23s64,pmp=3Dtrue
> > > > >=20
> > > >=20
> > > > Thank you. With the additional option, the issue no longer
> > > > occurs.
> > >=20
> > > I have done an incremental OpenSBI v1.8.1 release
> > > to address this issue. With this incremental release,
> > > you don't have to explicitly pass "pmp=3Dtrue" to
> > > rva22s64 and rva23s64 CPU types in QEMU.
> >=20
> > Seems like we don't need this patch I sent a few days ago then:
> >=20
> >=20
> > "[PATCH] target/riscv/cpu.c: enable PMP by default for profile
> > CPUs"
> >=20
> > https://lore.kernel.org/qemu-devel/20260106205152.3654975-1-daniel.barb=
oza@oss.qualcomm.com/
> >=20
> >=20
> > We can leave this patch alone. We can also leave the update to
> > OpenSBI
> > 1.8 alone as well and update to 1.8.1 to get the fix.
>=20
> I think the QEMU patch is still needed because without PMP
> there is nothing to protect M-mode firmware (OpenSBI) from
> lower privilege modes.
>=20

Thank you for the update.

Kind regards,
Thomas Perrot

> Regards,
> Anup

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-xGGE0UGeN3ENBr+e+oL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmlhJ3QACgkQn8ALBXH+
Cu2jaQv9HMmSDjjprOsKWsDNJ/swLlEpz1Puno9SobwW7L3lgKjhOAJcs5ygx2Zk
3zuozOIeoWWCEzIyKGZ0tMps50PHZhgSPHZvz3m2/qFIWRHMLY4dZ1o1WaztZIL6
o4SodEQjfHAbmfhatimsXePBcf6bKD/7g+bB6C5pb0cdiZJVq5nnG1jhE3x0BHpv
M0ljf1rCYPfZ749KpDhr3MpTHSpsIYB9kh6vJzMtth8RGu0QvcHD+u3yPhx/bluv
cG1axxwUAf1heW0y6mtl/ruFcR8Uc/IvazC9HHxPlCTOecodS4yYHkPf/3lXfbQT
5bH6hcc0nJKZTQAtjpmSQY3zsyo0Y8d+c1Nj0MXksKkeoLmLNp7xPD4uMXtREbf3
/1FJIET/xxJq1oej2Df+aGQc5koW0bohu2dGBzknj9m1x6iYYep4wX2vEUhz+nIk
KjHeb1K1xzjEUiL6ccKCX5/sA76tOVvcBmjnd8pk/PdNhcQy4yXDLnTSNsTEQcmk
ZnJjKJhs
=ymtz
-----END PGP SIGNATURE-----

--=-xGGE0UGeN3ENBr+e+oL8--


--===============0414289258919107439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============0414289258919107439==--

