From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 14 May 2021 11:58:26 +0000
Subject: Why does the firmware memory region have no permissions?
In-Reply-To: <CO6PR04MB781291099CDAFBE5EF3C23E68D509@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <669a1252-0717-20ce-3741-213beb13cc00@danielschaefer.me>
 <b095eb4a-5193-be54-afc2-6c4c11347a36@danielschaefer.me>
 <CO6PR04MB781291099CDAFBE5EF3C23E68D509@CO6PR04MB7812.namprd04.prod.outlook.com>
Message-ID: <CO6PR04MB7812EBE9A040A32228EC902B8D509@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 14 May 2021 17:22
> To: Daniel Schaefer <daniel@danielschaefer.me>
> Cc: opensbi at lists.infradead.org; Chang, Abner (HPS SW/FW Technologist)
> <abner.chang@hpe.com>
> Subject: RE: Why does the firmware memory region have no permissions?
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> > Daniel Schaefer
> > Sent: 13 May 2021 10:26
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: opensbi at lists.infradead.org; Chang, Abner (HPS SW/FW Technologist)
> > <abner.chang@hpe.com>
> > Subject: Why does the firmware memory region have no permissions?
> >
> > Whoops, put CC as subject...
> >
> > On 5/12/21 6:20 PM, Daniel Schaefer wrote:
> > > Hi Anup,
> > >
> > > I'm in the process of upgrading EDKII to OpenSBI 0.9 and using the
> > > Generic
> > Platform.
> > >
> > > Previously we were doing sbi_init with M-Mode, adding our SBI
> > > extension and then calling sbi_switch_mode to switch to S-Mode. Now
> > > sbi_init disallows initializing to M-Mode, so I'm directly switching
> > > to S-Mode. It seems that even from S-Mode I can register our SBI
> > extension with sbi_ecall_register_extension.
> > > Is that correct?
> 
> The OpenSBI sources are meant to run only from M-mode so we cannot
> register SBI extension using sbi_ecall_register_extension().
> 
> The  sbi_switch_mode() is not stricter due to OpenSBI domain support.

The sbi_hart_switch_mode() is fine. It's the sbi_domain_init() which is
enforcing next booting stage to be at lower privilege for root domain.

For time being, you can try removing checks on "dom->next_mode"
in sanitize_domain()

> 
> Next booting stage has to run from lower privilege mode (S-mode or U-
> mode) otherwise OpenSBI cannot protect itself from next booting stage if it
> starts in M-mode.
> 
> > >
> > > However, sbi_init when directly initializing to S-Mode checks that
> > > the
> > start_address is executable.
> > > So I'm wondering why the FW region isn't set as executable in OpenSBI?
> > > How do other FWs like U-Boot get around this?
> > >
> > >
> >
> https://github.com/riscv/opensbi/commit/b1678af210dc4b4e6d586d6d96617
> > e
> > > 9641618994#diff-
> > 6e8e352a8a90ba5a7adbb58a806ed9b6404c2c67db416332f9c05a
> > > 6b322eecd6R346
> > >
> > > If I try to set my own regions by adding .domains_root_regions I get
> > > another error because OpenSBI checks that I have a region that is
> > > the same as the FW region added by OpenSBI. If I duplicate the FW
> > > region and mark the first one as executable I can pass the
> > > executable check and also the check that there's an FW region.
> > > Additionally we have to manually call pmp_set in our custom platform
> > > to make the FW region RWX.
> > >
> > > That seems like a workaround, however. Do you have any suggestion to
> > properly fix it?
> > > I'm sure we're misunderstand something.
> 
> I suggest two things:
> 1) Register your custom SBI extension from M-mode only before switching to
> S-mode
> 2) Make sure that fw_start and fw_size set in the sbi_scratch for each HART
> only point to the M-mode code and data. Preferably have S-mode code and
> data not linked in the same binary as M-mode code and data.
> 
> > >
> > > For context: We're writing the start addr and size of our FW image
> > > into the scratch space before OpenSBI is initialized. Therefore
> > > we're expecting it to set the PMP settings correctly.
> > >
> > > Please check out my workaround commit:
> > > https://github.com/riscv/riscv-edk2-platforms/commit/a5ac63096ca5da7
> > > 95
> > > 042baf650170643fe219cab
> > >
> > > Thanks,
> > > Daniel
> 
> Regards
> Anup

Regards,
Anup

