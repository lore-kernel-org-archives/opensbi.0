From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Dec 2022 12:01:24 -0800
Subject: [PATCH Zisslpcfi 2/2] lib: sbi: zsslpcfi detection and elp cfi
 state reflect back in status
In-Reply-To: <mvmwn6kn9gl.fsf@suse.de>
References: <20221212030804.927309-1-debug@rivosinc.com> <20221212030804.927309-3-debug@rivosinc.com>
 <CAEUhbmVbzA5UhFnV+Z_eDVBd1BizjyYjrzoJ7ymT4c=Vx6FjiQ@mail.gmail.com> <mvmwn6kn9gl.fsf@suse.de>
Message-ID: <CAKC1njQB_QQAA5q6LpKk=PY3pf4Vp897BGREP063fHyxKOXChA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks Andreas and Bin for your review comments.
Sent out v2 version of the patch.

-Deepak

On Wed, Dec 21, 2022 at 5:59 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Dez 21 2022, Bin Meng wrote:
>
> >> @@ -693,6 +704,16 @@ __mhpm_skip:
> >>                                         SBI_HART_EXT_SMSTATEEN, true);
> >>         }
> >>
> >> +       if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
> >> +               val = csr_read_allowed(CSR_SSP, (unsigned long)&trap);
> >> +               ssp_exist = trap.cause?0:1;
>
>                    ssp_exist = trap.cause == 0;
>
> --
> Andreas Schwab, SUSE Labs, schwab at suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."

