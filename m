From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Fri, 22 Sep 2023 08:58:23 +0800
Subject: [PATCH 3/6] platform: andes: Add Andes custom PMU support
In-Reply-To: <ZQvXaQ842WGRNH1W@APC323>
References: <20230906094051.3957564-1-peterlin@andestech.com>
 <20230906094051.3957564-4-peterlin@andestech.com>
 <CA+V-a8tT4aiD0HSHZAMok2o1PeFvo+RiMWsMW0ioMSUHYpEBKw@mail.gmail.com>
 <ZQvXaQ842WGRNH1W@APC323>
Message-ID: <ZQzmrtt5861O6n5H@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > > +               sbi_pmu_set_device(&andes_pmu);
> > In my opinion we might want to append the PMU node to DT here
> 
> Sure, I will add fdt fixup so RZ/Five users won't need to manually
> append the PMU node.
> 
> > and pass that DT fragment to the higher stack instead of adding it in Linux.
> 
> The PMU node is not visible to S-mode SW (U-Boot proper or Linux) since
> it is only used to initialize the event counter mappings and erased in
> the generic_final_init() [2].

Sorry. It should be said that part of it (riscv,*event-to-mhpm* properties)
will be erased, not the entire node.

the higher stack can still find the pmu node:

  pmu {
      compatible = "riscv,pmu";
  }

> Thanks,
> Peter Lin
> 
> [1] https://github.com/riscv-software-src/opensbi/blob/v1.3.1/lib/sbi/sbi_pmu.c#L583
> [2] https://github.com/riscv-software-src/opensbi/blob/master/platform/generic/platform.c#L172
> 

