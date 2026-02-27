Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C03AFEE4C8
	for <opensbi@archiver.kernel.org>; Sat, 28 Feb 2026 05:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=du0BqgKnphyCQ9asRYKfaIYrhI1e5y9Ubtc/WlLUkuU=; b=e/RiKoOBTSpZ0/Eu/+QNOkOETC
	yE+yAk14hBO6j7qrFjn+DSoUNcRqDaVq4o+t/sxzjfJbA35N7hBtignwbjV2/MZX9mxZ82pykfH/E
	TpmCmhIeyjaQXvLBgw/vX5H1o/3Gs+u2EUcv7kkAdSKa54r9xASurtNj+ueJ97QfygZinMpcpxedx
	+p7nfYaZo/meZVgzkBWg4Qr/oW4nxoxncOOGSfH1hdthRhTMc7AagBwHu5hHblEIizCRmQgwNcCd3
	awysPUPXluvBlbyGzQ+Ddzmd5jnZ+lOi13h9iomvfXDVoTrdl28mK6TmUZ4g8xfP3evpDjuS1pI1+
	x2NNnoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwCad-00000009VVW-1kYF;
	Sat, 28 Feb 2026 05:10:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmWD-00000007Ts5-1cg0
	for opensbi@lists.infradead.org;
	Fri, 27 Feb 2026 01:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B69660054
	for <opensbi@lists.infradead.org>; Fri, 27 Feb 2026 01:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11466C116C6
	for <opensbi@lists.infradead.org>; Fri, 27 Feb 2026 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772155188;
	bh=+gUPBM5SoCWpx3cWG+Ngcfu9cNek+N8PTojRQu+8zHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oVSmNZge7Ha8rHPmkzZBp0Fny1TLzgwrDf4ffgDffXrteigYd8lJ5QBhUskTW3Ojt
	 EpcpvrvAqDXGtkhScff3bBvoRnV/nAN61cX4dArQsoQWxmjNJiqcmGhZ3Wy/kMPVj6
	 72v8YXoThIpu6HFO7a/x7irjNHLDzTnjyoz+W4JF5qfPIwcu3tP9YLNbqRvoBff1EW
	 FcWx6HdevGvQ/MfulK1h3BjiXNexYOfSpH63Uxgv/UnMe0RVaSxBaRcZXb3cjK3W40
	 sMETZlhqupeP2KbZUak2v6IaQ+fmSe/rbnD/u2CEi8a52sgD6tvw3W1iajTtA77DUQ
	 HIEzBN6YYE4Dw==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e87589e8so1416380f8f.3
        for <opensbi@lists.infradead.org>; Thu, 26 Feb 2026 17:19:48 -0800 (PST)
X-Gm-Message-State: AOJu0Yw6Jb+dTx4ZoeW7QkNFe+0hnCwb4H/6jAJRKSOwzXgfRmUczD9G
	I+sGky9oEtOnMBJZdm6Tf12z+74AuauHyvnxK1GSyAqCO6lIHAQod3ARjs+CDgPfyGBSQBwmF0F
	xU78T8zC3UE34C8kjkg+9yy50KMoAhDA=
X-Received: by 2002:a05:6000:290a:b0:439:953c:2d77 with SMTP id
 ffacd0b85a97d-4399de2b58fmr1298272f8f.43.1772155186598; Thu, 26 Feb 2026
 17:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20260226123408.1597-1-cp0613@linux.alibaba.com> <20260226123408.1597-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260226123408.1597-3-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 27 Feb 2026 09:19:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSxYBMpGishhuXROeJbke9+vhf-uZRKDQDcCoxRjSMvQw@mail.gmail.com>
X-Gm-Features: AaiRm51OleFCrGUge_OG6C-6Apb060eWnLK0l1nnGUoCX6MWv3FvPLqvYJ4SVtc
Message-ID: <CAJF2gTSxYBMpGishhuXROeJbke9+vhf-uZRKDQDcCoxRjSMvQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib: sbi: Flush cache entries after writing PMP CSRs
To: cp0613@linux.alibaba.com
Cc: opensbi@lists.infradead.org, anup@brainfault.org, 
	samuel.holland@sifive.com
X-Mailman-Approved-At: Fri, 27 Feb 2026 21:10:04 -0800
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
Content-Type: multipart/mixed; boundary="===============0542826353262286500=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============0542826353262286500==
Content-Type: multipart/alternative; boundary="0000000000006257aa064bc40873"

--0000000000006257aa064bc40873
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 8:34=E2=80=AFPM <cp0613@linux.alibaba.com> wrote:

> From: Chen Pei <cp0613@linux.alibaba.com>
>
> As the privileged specification states, after writing to the PMP CSRs,
> a SFENCE.VMA or HFENCE.GVMA instruction should be executed with rs1=3Dx0
> and rs2=3Dx0 to flush all address translation cache entries.
>
> Considering the performance issues caused by flushing all address
> translation cache entries, sbi_hart_pmp_fence_vma is used.
>
It's not aligned with the spec description; PMP is about PA, but SFENCE.
VMA is about the VA. So we don't know whether the other VAs has mapped to
the PA that the pmp is related to.

That's why spec needs "rs1=3Dx0 and rs2=3Dx0 to flush all address translati=
on
cache entries."


>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  lib/sbi/sbi_hart_pmp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
> index 80407110..dc7f61fb 100644
> --- a/lib/sbi/sbi_hart_pmp.c
> +++ b/lib/sbi/sbi_hart_pmp.c
> @@ -270,14 +270,21 @@ static int sbi_hart_smepmp_map_range(struct
> sbi_scratch *scratch,
>                              pmp_flags, base, order);
>         pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
>
> +       sbi_hart_pmp_fence_vma(addr, size);
> +
>         return SBI_OK;
>  }
>
>  static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
>                                        unsigned long addr, unsigned long
> size)
>  {
> +       int ret;
> +
>         sbi_platform_pmp_disable(sbi_platform_ptr(scratch),
> SBI_SMEPMP_RESV_ENTRY);
> -       return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +       ret =3D pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +       sbi_hart_pmp_fence_vma(addr, size);
> +
> +       return ret;
>  }
>
>  static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)
> @@ -333,6 +340,8 @@ static void sbi_hart_pmp_unconfigure(struct
> sbi_scratch *scratch)
>                 sbi_platform_pmp_disable(sbi_platform_ptr(scratch), i);
>                 pmp_disable(i);
>         }
> +
> +       sbi_hart_pmp_fence_all();
>  }
>
>  static struct sbi_hart_protection pmp_protection =3D {
> --
> 2.50.1
>
>

--=20
Best Regards
 Guo Ren

--0000000000006257aa064bc40873
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 26,=
 2026 at 8:34=E2=80=AFPM &lt;<a href=3D"mailto:cp0613@linux.alibaba.com">cp=
0613@linux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Chen Pei &lt;<a href=3D"mailto:cp0613@linux.ali=
baba.com" target=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
<br>
As the privileged specification states, after writing to the PMP CSRs,<br>
a SFENCE.VMA or HFENCE.GVMA instruction should be executed with rs1=3Dx0<br=
>
and rs2=3Dx0 to flush all address translation cache entries.<br>
<br>
Considering the performance issues caused by flushing all address<br>
translation cache entries, sbi_hart_pmp_fence_vma is used.<br></blockquote>=
<div>It&#39;s not aligned with the spec description; PMP is about PA, but S=
FENCE. VMA is about the VA. So we don&#39;t know whether the other VAs has =
mapped to the PA that the pmp is related to.<br><br>That&#39;s why spec nee=
ds &quot;rs1=3Dx0 and rs2=3Dx0 to flush all address translation cache entri=
es.&quot;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Pei &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" tar=
get=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0lib/sbi/sbi_hart_pmp.c | 11 ++++++++++-<br>
=C2=A01 file changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c<br>
index 80407110..dc7f61fb 100644<br>
--- a/lib/sbi/sbi_hart_pmp.c<br>
+++ b/lib/sbi/sbi_hart_pmp.c<br>
@@ -270,14 +270,21 @@ static int sbi_hart_smepmp_map_range(struct sbi_scrat=
ch *scratch,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmp_flags, base, order);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base,=
 order);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sbi_hart_pmp_fence_vma(addr, size);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return SBI_OK;<br>
=C2=A0}<br>
<br>
=C2=A0static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
long addr, unsigned long size)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbi_platform_pmp_disable(sbi_platform_ptr(scrat=
ch), SBI_SMEPMP_RESV_ENTRY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return pmp_disable(SBI_SMEPMP_RESV_ENTRY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pmp_disable(SBI_SMEPMP_RESV_ENTRY);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sbi_hart_pmp_fence_vma(addr, size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch)<br>
@@ -333,6 +340,8 @@ static void sbi_hart_pmp_unconfigure(struct sbi_scratch=
 *scratch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sbi_platform_pmp_di=
sable(sbi_platform_ptr(scratch), i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmp_disable(i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sbi_hart_pmp_fence_all();<br>
=C2=A0}<br>
<br>
=C2=A0static struct sbi_hart_protection pmp_protection =3D {<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best Regards<br>=C2=A0Guo Ren<br></div></div></d=
iv>

--0000000000006257aa064bc40873--


--===============0542826353262286500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============0542826353262286500==--

