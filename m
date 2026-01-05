Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293EC79FA7
	for <opensbi@archiver.kernel.org>; Mon,  5 Jan 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jHct4/JwMZH5S5062EMowQCMi7pN+2MA60WwXpNJ+3c=; b=ExY
	hB08Utsyy0TfR8M0OO82vZczFbrApvmh0kdh2qevdiw4y9zxfURjYyKZVEfuF6TIl2XFyQQun8ECV
	QpHFym2nMJlpqDWZBgunKKOSf2djisk7jWY6ydTHLhQ0PqevKMJF0u27qbuZpiNYRy3W0GFm8SICT
	REOF+MbUbz45FSq+vVEBjHYWx9596GiT9e4Bf6hG0X5PTPgKiiG/lpAOkJ0pk+SpMIlI5ODfPNJpm
	e/QLVrWVDGd4I8j89keb0Qrv370QwUnJGsmwT4sFOPUIrVB8j42GNFcxFcB8SlHdaOFoiNEx1SY2N
	5r6CsTxtdeuaER7MXatRttcliI3mTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcobk-0000000BrOt-3RNk;
	Mon, 05 Jan 2026 17:43:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcobh-0000000BrM8-3dn4
	for opensbi@lists.infradead.org;
	Mon, 05 Jan 2026 17:43:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C2E01A2666
	for <opensbi@lists.infradead.org>; Mon,  5 Jan 2026 17:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6930A60726;
	Mon,  5 Jan 2026 17:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3F9F103C833F;
	Mon,  5 Jan 2026 18:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767634981;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:autocrypt;
	bh=8fJP1eoAhcCEePVcQigflE/Zszj3tDC99oN3Cllj054=;
	b=SG/ugnBj+vW9vRRbIrsBfXvbFIGfl3X51+/WUyf1xJ4uhYPsoSmSQ+w+nrEyJx2wDV1WiX
	ZsMDfxHA1UEBdaM43j2UGVhT9/859Hzvabdw5CVqqWHizepowRqe0WfXLt5P9tvNacC2l/
	xAfb4YtyzHH/DJ9C3aWaUcVgA63LfAuq1PzY+9rNZJGcAkG/zlI17kz+2CXUz+iSNACx6Q
	fSEIM1sJ0UIsqUAuLLD8ITX+i1g4t4SD0aZKRSw3UtyvYVHLgMkU2NlEhxep3javzgiYaU
	I99nVlNPP5ZDS/7wb3e5WiV66FN2QuKwxvr/qAxic9QXntcIACwpdclm2fHSsA==
Message-ID: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
Subject: Hart isolation configuration failure (error -3) with OpenSBI 1.8 on
 QEMU 10.1.3 rva22s64/rva23s64 profiles
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: OpenSBI <opensbi@lists.infradead.org>, qemu-riscv@nongnu.org
Cc: thomas.perrot@bootlin.com
Date: Mon, 05 Jan 2026 18:42:58 +0100
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
X-CRM114-CacheID: sfid-20260105_094306_046801_E4B3432F 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2453636235348803285=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org


--===============2453636235348803285==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8OSXYm0yJpz05HVEcSe1"


--=-8OSXYm0yJpz05HVEcSe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Happy New Year!

I'm facing a hart isolation configuration error when running OpenSBI
1.8 on QEMU 10.1.3 with the RISC-V application profiles rva22s64 and
rva23s64:

    init_coldboot: hart isolation configure failed (error -3)

No issue occurs when using the rv64 profile. The system continues to
boot after the error, but I'd like to understand the root cause.

I haven't tested OpenSBI 1.8 on real hardware yet - that's my next
step.

Is there a known QEMU issue? Is there a recommended workaround besides
using rv64?

Below is the complete trace:

qemu-system-riscv64 -device virtio-net-
device,netdev=3Dnet0,mac=3D52:54:00:12:35:02 -netdev
user,id=3Dnet0,hostfwd=3Dtcp:127.0.0.1:2222-:22,hostfwd=3Dtcp:127.0.0.1:232=
3-
:23,tftp=3D/src/build/tmp/deploy/images/qemuriscv64 -object rng-
random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0 =
-
drive id=3Ddisk0,file=3D/src/build/tmp/deploy/images/qemuriscv64/core-
image-minimal-qemuriscv64.rootfs-20260105173847.ext4,if=3Dnone,format=3Draw
-device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device usb-
tablet -device usb-kbd  -machine virt -cpu rva23s64 -smp 4 -m 256 -
snapshot -serial mon:stdio -serial null -nographic -device bochs-
display -bios /src/build/tmp/deploy/images/qemuriscv64/fw_jump.elf -
kernel /src/build/tmp/deploy/images/qemuriscv64/Image -append
'root=3D/dev/vda rw  mem=3D256M ip=3Ddhcp console=3DttyS0 console=3Dhvc0
earlycon=3Dsbi swiotlb=3D0

OpenSBI v1.8
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name               : riscv-virtio,qemu
Platform Features           : medeleg
Platform HART Count         : 4
Platform HART Protection    : ---
Platform IPI Device         : aclint-mswi
Platform Timer Device       : aclint-mtimer @ 10000000Hz
Platform Console Device     : uart8250
Platform HSM Device         : ---
Platform PMU Device         : ---
Platform Reboot Device      : syscon-reboot
Platform Shutdown Device    : syscon-poweroff
Platform Suspend Device     : ---
Platform CPPC Device        : ---
Firmware Base               : 0x80000000
Firmware Size               : 357 KB
Firmware RW Offset          : 0x40000
Firmware RW Size            : 101 KB
Firmware Heap Offset        : 0x4d000
Firmware Heap Size          : 49 KB (total), 0 KB (reserved), 13 KB
(used), 35 KB (free)
Firmware Scratch Size       : 4096 B (total), 1464 B (used), 2632 B
(free)
Runtime SBI Version         : 3.0
Standard SBI Extensions     :
time,rfnc,ipi,base,hsm,srst,pmu,dbcn,fwft,legacy,dbtr,sse
Experimental SBI Extensions : none

Domain0 Name                : root
Domain0 Boot HART           : 0
Domain0 HARTs               : 0*,1*,2*,3*
Domain0 Region00            : 0x0000000080040000-0x000000008005ffff M:
(F,R,W) S/U: ()
Domain0 Region01            : 0x0000000080000000-0x000000008003ffff M:
(F,R,X) S/U: ()
Domain0 Region02            : 0x0000000000100000-0x0000000000100fff M:
(I,R,W) S/U: (R,W)
Domain0 Region03            : 0x0000000010000000-0x0000000010000fff M:
(I,R,W) S/U: (R,W)
Domain0 Region04            : 0x0000000002000000-0x000000000200ffff M:
(I,R,W) S/U: ()
Domain0 Region05            : 0x000000000c400000-0x000000000c5fffff M:
(I,R,W) S/U: (R,W)
Domain0 Region06            : 0x000000000c000000-0x000000000c3fffff M:
(I,R,W) S/U: (R,W)
Domain0 Region07            : 0x0000000000000000-0xffffffffffffffff M:
() S/U: (R,W,X)
Domain0 Next Address        : 0x0000000080200000
Domain0 Next Arg1           : 0x0000000082200000
Domain0 Next Mode           : S-mode
Domain0 SysReset            : yes
Domain0 SysSuspend          : yes

Boot HART ID                : 0
Boot HART Domain            : root
Boot HART Priv Version      : v1.12
Boot HART Base ISA          : rv64imafdcbvh
Boot HART ISA Extensions    :
smstateen,sscofpmf,sstc,zicntr,zihpm,zicboz,zicbom,svpbmt,sdtrig,svade,
smnpm,ssstateen
Boot HART PMP Count         : 0
Boot HART PMP Granularity   : 0 bits
Boot HART PMP Address Bits  : 0
Boot HART MHPM Info         : 16 (0x0007fff8)
Boot HART Debug Triggers    : 2 triggers
Boot HART MIDELEG           : 0x0000000000003666
Boot HART MEDELEG           : 0x0000000000f4b509
init_coldboot: hart isolation configure failed (error -3)

Kind regards,
Thomas Perrot
--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-8OSXYm0yJpz05HVEcSe1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmlb+CIACgkQn8ALBXH+
Cu1/YAv+L9yTrGJDy1PjG8qiHbLsziER7F7r1P8Tz/fO/KCS1TL1i7C5638K5+uf
cB9ViOqpYYnF7dE34d+oms7xn3MDDMZIYowlRz1/sr1UfZc751CibuGvVpZEPzQp
/Hqigx2hqe9hPO9qNYZfu6tYYdgYE7CB5BZOByubxNY2XfaxcSLrU7SpFe5s5D4G
FDKu4RPSKHPinTb/dS/9vd6M+3GLH8quVUfjBpKwqOwDEtSXQmL6J6n/revjY6LN
arIMj+RRLU3SGS+ihj3lWYhLe77T5Evg1wsJDM3DIbaFWDDHB+Z0zB2YZmOFLjWM
4Bh4FZ/myxwptJtK+2pZZfjLz7seTkl7YOHlWpKXuhefnZs/M2T7kSKgIxSe+Uv4
92tQ/3g47Ul03xsM3hWs648lSk3IzzKCxHC5iqeqm2l8NHnTVzMyBJ3RLUEt3nXJ
GKFYGKs67omYe6qpENoevP5YkwNvrRwRAc6ydmNVBf8oOZ345TnjYB/AxzAGx1Ys
dVUxbzB5
=jEj7
-----END PGP SIGNATURE-----

--=-8OSXYm0yJpz05HVEcSe1--


--===============2453636235348803285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============2453636235348803285==--

