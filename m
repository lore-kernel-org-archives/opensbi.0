From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 31 Mar 2021 05:05:13 +0000
Subject: Floating point emulation support policy
In-Reply-To: <EB123894-29D2-4EC4-88FA-D6CB975B0C98@mails.ucas.ac.cn>
References: <EB123894-29D2-4EC4-88FA-D6CB975B0C98@mails.ucas.ac.cn>
Message-ID: <DM6PR04MB6201773E4F20A5D2906678C58D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Xim
> Sent: 30 March 2021 08:14
> To: opensbi at lists.infradead.org
> Subject: Floating point emulation support policy
> 
> Hi all,
> 
> My institution wants to run GNU/Linux distributions on a RISC-V core without
> hardware floating point support. We used Berkeley Boot Loader (BBL) before
> which has a built-in support for soft floating point emulation. We are
> swtching to OpenSBI but no such emulations seem to exist in OpenSBI for
> now. I wonder if OpenSBI would be happy to accept a port of such functions.

The suggestion of adding floating point emulation in OpenSBI has been
proposed to us quite a few times in past.

Instead of adding floating point emulation in OpenSBI, another option is
to disable FP for Linux RISC-V kernel and compiler user-space using soft-float
toolchain. This approach will perform much better as compared to OpenSBI
trapping and emulating floating point instructions.

Regards,
Anup


