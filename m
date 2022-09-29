From: Heiko Stübner <heiko@sntech.de>
Date: Thu, 29 Sep 2022 13:54:16 +0200
Subject: [PATCH v4 3/5] lib: sbi_pmu: add override for counter data
In-Reply-To: <CAOnJCUKKwy2_WdMKYkFeMnb68ay0FSmuhkiGaKXBqAJyFApoXA@mail.gmail.com>
References: <20220926101607.731275-1-heiko@sntech.de> <20220926101607.731275-4-heiko@sntech.de> <CAOnJCUKKwy2_WdMKYkFeMnb68ay0FSmuhkiGaKXBqAJyFApoXA@mail.gmail.com>
Message-ID: <2197780.iZASKD2KPV@diego>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 29. September 2022, 10:28:57 CEST schrieb Atish Patra:
> On Mon, Sep 26, 2022 at 3:18 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > In general counter-data is auto-detected but some platforms
> > may implement counters in a way that breaks this detection.
> >
> > Implement an abstraction that those platforms can hook into
> > and override the counter-data.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  include/sbi/sbi_pmu.h | 8 ++++++++
> >  lib/sbi/sbi_hart.c    | 7 +++++++
> >  lib/sbi/sbi_pmu.c     | 7 +++++++
> >  3 files changed, 22 insertions(+)
> >
> > diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
> > index c365243..d257b14 100644
> > --- a/include/sbi/sbi_pmu.h
> > +++ b/include/sbi/sbi_pmu.h
> > @@ -78,6 +78,11 @@ struct sbi_pmu_device {
> >          * Custom function returning the machine-specific irq-bit.
> >          */
> >         int (*hw_counter_irq_bit)(void);
> > +
> > +       /**
> > +        * Override autodetected counter data.
> > +        */
> > +       void (*hw_counter_data)(unsigned int *count, unsigned int *bits);
> >  };
> >
> >  /** Get the PMU platform device */
> > @@ -95,6 +100,9 @@ void sbi_pmu_exit(struct sbi_scratch *scratch);
> >  /** Return the pmu irq bit depending on extension existence */
> >  int sbi_pmu_irq_bit(void);
> >
> > +/** Allow non-standard platforms to override probed counter information */
> > +void sbi_pmu_override_counter_data(unsigned int *count, unsigned int *bits);
> > +
> >  /**
> >   * Add the hardware event to counter mapping information. This should be called
> >   * from the platform code to update the mapping table.
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index 45fbcde..6506a19 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -632,6 +632,13 @@ __mhpm_skip:
> >  #undef __check_csr_2
> >  #undef __check_csr
> >
> > +       /**
> > +        * Allow non-standard implementations to override the detected
> > +        * values for number of counters and bits.
> > +        */
> > +       sbi_pmu_override_counter_data(&hfeatures->mhpm_count,
> > +                                     &hfeatures->mhpm_bits);
> > +
> >         /* Detect if hart supports Priv v1.10 */
> >         val = csr_read_allowed(CSR_MCOUNTEREN, (unsigned long)&trap);
> >         if (!trap.cause)
> > diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> > index 91d9ccc..c8becf3 100644
> > --- a/lib/sbi/sbi_pmu.c
> > +++ b/lib/sbi/sbi_pmu.c
> > @@ -852,3 +852,10 @@ int sbi_pmu_init(struct sbi_scratch *scratch, bool cold_boot)
> >
> >         return 0;
> >  }
> > +
> > +void sbi_pmu_override_counter_data(unsigned int *count,
> > +                                  unsigned int *bits)
> > +{
> > +       if (pmu_dev && pmu_dev->hw_counter_data)
> > +               pmu_dev->hw_counter_data(count, bits);
> > +}
> > --
> > 2.35.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> We may need similar functionality in the future as well where the
> platform may override the hart feature details.
> Should we pass the hfeatures in the extension_init callback so that a
> specific platform override can access it ?

you tell me :-) .

I.e. I didn't want to expose the previously unexposed hfeatures struct
(right now it's local to sbi_hart) but if it's ok to expose it, directly
setting the hfeatures values of course makes a lot of sense also for
future uses.


Heiko



