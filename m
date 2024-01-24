From: Xiang W <wxjstz@126.com>
Date: Wed, 24 Jan 2024 22:31:17 +0800
Subject: [PATCH] lib:firmware: Select preferred boot hart for cold
 boot.
In-Reply-To: <tencent_60D8B69591C80F371B64DCC4AD23956C0807@qq.com>
References: <tencent_E524945B0D326FE2C19150B61FACED0A6806@qq.com>
	 <d2b9d7e72fd17fe8c3295280c655a45eb23941b8.camel@126.com>
	 <tencent_60D8B69591C80F371B64DCC4AD23956C0807@qq.com>
Message-ID: <2cbfde0f8917f93cdb0493756f5706f0e65a63fc.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-24???? 05:25 +0000?yangcheng.work at foxmail.com???
> > add check here
> > ????? if (scratch->boot_hart != -1UL && sbi_platform_cold_boot_allowed(plat, scratch->boot_hart)
> > ????????????? sbi_hart_hang();
> 
> What this check means is that if the preferred hart does not allow cold boot, will we enter sbi_hart_hang? 
> So should the conditions for judgment be like if (scratch-&gt;boot_hart != -1UL &amp;&amp; !sbi_platform_cold_boot_allowed(plat, scratch-
> &gt;boot_hart))?
Yes! This's right

Regards,
Xiang W
> 
> > > +??? if (sbi_platform_cold_boot_allowed(plat, hartid) && next_mode_supported) {
> > > +??????????? if (scratch->boot_hart == -1) {
> > replace -1 with -1UL
> > > +??????????????????? if (atomic_xchg(&coldboot_lottery, 1) == 0)
> > > +??????????????????????????? coldboot = true;
> > > +??????????? } else {
> > > +??????????????????? if (scratch->boot_hart == hartid)
> > > +??????????????????????????? coldboot = true;
> > > +??????????? }
> > > ???? }
> > > ?
> 
> Sorry the email I sent before was not plain text, I have changed the format now.
> Thank u.
> 
> Regards
> Cheng Yang

