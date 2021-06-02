From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 2 Jun 2021 11:51:49 +0000
Subject: [PATCH] firmware: Do not allow harts with different XLEN to boot
In-Reply-To: <85A3CECC-5E4B-4A0B-A93A-DC36E5E12504@jrtc27.com>
References: <20210602014201.246899-1-atish.patra@wdc.com>
 <85A3CECC-5E4B-4A0B-A93A-DC36E5E12504@jrtc27.com>
Message-ID: <CO6PR04MB7812833A0402EF3FEDFE27CF8D3D9@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Jessica Clarke <jrtc27@jrtc27.com>
> Sent: 02 June 2021 07:25
> To: Atish Patra <Atish.Patra@wdc.com>
> Cc: opensbi at lists.infradead.org; Anup Patel <Anup.Patel@wdc.com>
> Subject: Re: [PATCH] firmware: Do not allow harts with different XLEN to boot
> 
> On 2 Jun 2021, at 02:42, Atish Patra <atish.patra@wdc.com> wrote:
> >
> > OpenSBI is built separately for RV32/RV64. Thus, it shouldn't try to
> > boot harts with a different XLEN compared to what it is compiled with.
> >
> > This patch fixes the issue observed in beagleV which has two U74(RV64)
> > and one E24 (RV32) harts.
> 
> Is this really necessary? Can the different clusters not boot different
> OpenSBIs? This is a really gross hack for what seems like a stupid hardware
> decision if they both blindly load and run from the same place.

Ideally, a platform should boot different OpenSBI firmwares for clusters
with differing XLEN.

In any case, if a RV32 HART enters RV64 OpenSBI firmware (or vice-versa)
then the HART should enter a WFI hang loop very early.

This patch is more of a precautionary check for platforms like BeagleV
where HART with differing XLEN jumps to OpenSBI firmware.

Regards,
Anup

