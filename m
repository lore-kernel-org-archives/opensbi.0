From: Dmitry Dunaev <dunaich@mail.ru>
Date: Thu, 14 Apr 2022 10:56:33 +0300
Subject: [PATCH] lib: sbi/hart: preserve csr validation value.
Message-ID: <c94f2e1edf6207e7b08319f63ab6e189170b734a.camel@mail.ru>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > The OpenSBI hart init function hart_detect_features() try to read
> > important CSRs but reasign the last read value to the variable that
> > initially contains write probe value. So for series of CSRs (like
> > PMPADDRx) the secong CSR probe value will became the initial value
of
> > first probing CSR. To avoid of this issue the CSR read value should
be
> > saved in different variable. In this configuration the count of PMP
> > will detect rightly if any PMPADDR is hardwired to zero.
> >  
> > Signed-off-by: Dmitry Dunaev <dunaich@mail.ru>
> only change name from val to oldval?

It is important to have two variables. The 'val' which is contains the
probe value and 'oldval' which value will be changed each time when we
probe the CSR (the value which will restored in probed CSR).

> 
> Regards,
> Xiang W

BW, Dmitry



