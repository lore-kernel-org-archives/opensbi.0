From: Oleksii <oleksii.kurochko@gmail.com>
Date: Tue, 30 May 2023 14:47:14 +0300
Subject: reserved-memory nodes created by OpenSBI
In-Reply-To: <CAAhSdy1CsideBVoe1yw7v=wzzPyRQFtmzVvAdsX1oq2DMPfVNw@mail.gmail.com>
References: <CAMacjJzPFY85xouincvYdeh1TLOZEynVuzyVnztRNP4ht+Exhw@mail.gmail.com>
	 <CAAhSdy1CsideBVoe1yw7v=wzzPyRQFtmzVvAdsX1oq2DMPfVNw@mail.gmail.com>
Message-ID: <fa3712e7fdaae163e12d65f62092cc23b2533156.camel@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2023-05-23 at 19:18 +0530, Anup Patel wrote:
> On Tue, May 23, 2023 at 7:13?PM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> > 
> > Hello, dear community,
> > 
> > I would like to ask you about reserved-memory nodes, which are
> > created
> > by OpenSBI here:
> > https://github.com/riscv-software-src/opensbi/blob/v1.2/lib/utils/fdt/fdt_fixup.c#LL198C5-L198C30)/
> > 
> > The questions are the following:
> > 1. What is the purpose of extending dts by reserved-memory nodes? I
> > assume that it is necessary to reserve some memory ranges for
> > OpenSBI.
> > 2. Why OpenSBI needs to have a preserved memory?
> > 3. The memory-reserved ranges are overlapped with Linux's memory
> > node
> > range. Is it OK that OpenSBI's memory-reserved node ranges and
> > Linux's
> > memory node ranges overlap?
> 
> OpenSBI uses reserved-memory DT nodes to inform the next booting
> stage (including Linux) about the memory used by OpenSBI firmware.
> 
> If these reserved-memory DT nodes are not present then supervisor
> OS (Linux) might crash accessing the memory used by OpenSBI
> because OpenSBI protects its own memory using PMP.
> 
Thanks for the explanation.

~ Oleksii

