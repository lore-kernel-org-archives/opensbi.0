Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455BDEF48CB
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 03:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbo3NK4DlXATjMguJ2Al9WcZV6/FquUyUoMZvgThM30=; b=V7QeqWe9093vMO
	zJHrS0DtUCI0y8oZ4I9aVbbWbaS+Q4DgSApolhoKVxHo1okTyVe70ebgKFKNuPuEekO4F/f6ufuKV
	Bk1vdKVX/FkNE+ttgiUZl0PRjWONce1N7CsCQvhq8ErWIrSoFqPQDpWfqj0OLb9FP6B8Ba/CnJ9y4
	vNuvtQ7YTk+LZpnGJ3Dv4Ak51Tatk0vQVUl/2+nFkutY45lDorJmNaeXdhqInOx+QBx4nTjYQxH0v
	Pqg7WZoBFIBCwT7uv7d1xBfYkkTcavNU2UNzVTAs9RIltEOJu8Wp24qB6ol74RD9Ig9yhiM4aAQMY
	t7At5m+3ALDd/ZsXYNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkJB-00000002vso-3LE8;
	Fri, 13 Feb 2026 03:57:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqkJ9-00000002vsP-0lWM
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 03:57:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D2v2dI2093464
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 03:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMz6fiTm16Rs9spN11BOMjxVcsoX4+LpG10UDyTcO6A=; b=FJICuig9EDsbfXpE
	U8IeYGsCRPasaopaVrz5rUdp0nxB64wwY+6STD9Qb6MJEYLyLP/5hqPQ/eIjLy3J
	w1KoE1jDcrqcjtBvTM1Z0gddskbjdSIars0k8CMmVciobaVUkUve+prjVEZkTy33
	vDlocwVd5QXti1u7E6iQ/VkZmoFe9u8dZSjzZTml+920WHYkWSkNtLJ6QHIq6vmV
	MiQAu6UmRG3UpA8tP5doWagBg124bYu0NQ2mABtIXR09mQLXkDnWyqzhdH36TePd
	hy7u6SLQLONbrIYDC5+6iObyiOpx6Iz0aOOBJ7B9t6IpRYuo7kRca4e7PFjHnhjm
	09g7Ug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y20sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 03:57:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2baa7366f9aso3661949eec.1
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 19:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770955048; cv=none;
        d=google.com; s=arc-20240605;
        b=GeFu+VpZmB6Ep4GrAxeKGYVNQBhA403ZzzdTZQrMrSEhifRSy6wteJ7hy43lDEFNmu
         duEb1v1Fx849Y494UbcPxTwzNYkToGppKgZE1VYHTjtfreuZ7LA/xN8TA3aX+eTfIOBk
         myB1FFfpAhJjRV2mX9qPuLHMCYkfSuAmlhB1xzNhwrNBriHBSI0v2RIEGXtXBcuk6JXQ
         ZNqg+5v7yV8b8HxnxjRfZOgsqVaJY9xbYJn5rZkA11Zx9A4OU9Jh9bRS5Hx3moM7jvBa
         K+39+rPALieXsxTtnuGYWfqf2n1Uh/vPgBXWAJGbuGta7zNJu+HRN4xawtpZ6na++ZPD
         WQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zMz6fiTm16Rs9spN11BOMjxVcsoX4+LpG10UDyTcO6A=;
        fh=nsXN9NJF9xQP/l60rbTNONr/QZCFJtXmoaefPbwjpZU=;
        b=IkEqg8ep9IQHyJWW7ILfGWjkhw2DMW8X65N9mqnLIDp3eU8p+VCRzqHhpP86SDLb14
         YQ+L31xO7qx506Q9Mp0G1VeByEE8RWLC36XXvj7Qn68rPhothskVUjOKydjo8ZszMa4d
         uqqJF7Qkf0WHTei4E5+uhbQs7qYOSL/+EEZaOiKXyFzr24ee1syKd/TxhjhriUfOUybQ
         Zi3xJusNYmZmAaSVcGsWZA+B8fU58l9gKw+JOpw62miREWvSEOCoGzibvFatJj0/gLXZ
         jSq2KBq0tRG5Og+qtepiHiAjN9I3qM46wq3RrOCIfK3rNVwxaFQvuZUlF6CsWGtKU2Fx
         fPIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770955048; x=1771559848; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMz6fiTm16Rs9spN11BOMjxVcsoX4+LpG10UDyTcO6A=;
        b=du4y98fIEewkv0FtjNfvhoNXhxEikVYxwZu5bDr1IeO+YVyYmlM304qNuOeX+BCNQ+
         jj8CPqRmC2mNOgYbEzkVxa8wxTJMYneXqe3hWREQvl69sojQ5yc64Iy4S6THDRor1SB9
         qDFsQc6nkr98OiUcbapOo+itAjItfF3Zu3GBQuKtOOkUPlR5A4UuOCWdGUIXh7HDA1Yw
         qT8qdBR+1630nFkH+hJOpbt7CNRd+EGSK44vv/qmEo+CouMKyiWR59LP06p9DOgNsXkn
         gukSvl4gimHO6SPuTXfGukuy5veyovmXpsIFiCwCGR+RZZA0ThrNgH0d5QQ5yG/pMDKk
         Sbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770955048; x=1771559848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zMz6fiTm16Rs9spN11BOMjxVcsoX4+LpG10UDyTcO6A=;
        b=DTZHSfI37IqI8E+/ZdcWHX+/B9PGOFBxYzZ4TB+26s9impnQZZW7jdKehZSfy8PnEf
         blAwAwSvi/Jz5nHZUwgMgjX8o5J8Ttvy7GZvTY7iYirDsAvXpdGSKT2uPOWWnAHr1Izf
         R56JoW4JmBpSBvSdNQmwdspLSa0/BkPDPVmrLw/h6AXlQ/Nty8qC31Vvwqo6GJTSrkBS
         RQzvmy1GqJuo+gVaYOmcm/BetXY7OeZy5UqMaIK/Y1LaJRC15TgW4T76QYbIN8DmgnW8
         PA41nXeVHtpKojrMNNUTYrNzeDropc0RI1/UeUFSFfHGgi6IV30HGKkVL8x3Evea1YYt
         Sczg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ZLalJIGuYmTACvNWsWrxc4OW4jWcNmWoNwdM1ocsDFc3a/FPd+Kp/z00oT8J4RxtJtPzLbhy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3R0mvDHLoavPt1+uyHmf+/2dcJ6/p34qaeoonKpi+rBUldmZp
	Wuc6S/2686Y1kX8ybGjp/pWfcq7KSx/xgfVSVXWijV9+XxA9uOYGqDFW4s27JnZuUbQh6lvfSrh
	5EFQVWmkkjwB97QmQDvZAiTHkhOAQ0zpHhKZvpnpPmzTxTLBGwGyRlr/0I9wkmymYTOsyrP0FjH
	LwlhVe2YB+InpRTG1h/6/j1huhziMmndbCXtzWresR
X-Gm-Gg: AZuq6aJO9mDZuU9YH04o2uJcOfXbqmLDwLDaOd5lzlxWlSNje0FzuRZ9tbDienbjZgz
	ASQgZfiu4xYb60r6GFZgYF9MkmCVQQ9zdxMOiHs4U/RwG94ZIsNZeP9A/80bfo0Yy878Fi6MWzF
	uSFmQjIIOaHBiEzINMhlsyahctl6jvjwr7IpotjtMDMGKfX75kDlTQiS0krAF607K3a6S6Xscc1
	1MflKg4
X-Received: by 2002:a05:7300:fd11:b0:2ba:8f47:fe4f with SMTP id 5a478bee46e88-2babc4bd2c4mr192154eec.18.1770955047929;
        Thu, 12 Feb 2026 19:57:27 -0800 (PST)
X-Received: by 2002:a05:7300:fd11:b0:2ba:8f47:fe4f with SMTP id
 5a478bee46e88-2babc4bd2c4mr192144eec.18.1770955047443; Thu, 12 Feb 2026
 19:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-5-anup.patel@oss.qualcomm.com> <2c67verpauee2cnoauviiclujhuydiorbavxvrhfobbqdrlji6@tenf7n66gnu5>
In-Reply-To: <2c67verpauee2cnoauviiclujhuydiorbavxvrhfobbqdrlji6@tenf7n66gnu5>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 09:27:15 +0530
X-Gm-Features: AZwV_QjKjhrjvvCqKkV6JITXw2r5n8_8RTCy8OjbFPiJGdgiojl4ZwwomfXHzjA
Message-ID: <CABBgwmtAL9r4cfD976b--h6+Xj0LgbZy78oGmaMQKWO4kgHBmA@mail.gmail.com>
Subject: Re: [PATCH 4/8] lib: utils/irqchip: Add IDC to hartindex map in
 struct aplic_data
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698ea128 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=ejzrmVCvQh2HJ2DPluUA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAyNiBTYWx0ZWRfX/0GJWJd2jrYs
 R/xz2ZwNM+OXa0lq/l3arn4P/IRFQfd2N8WXRCe4JdpKX60r4HwJ3rQvrdi/TkrD9+qS4IgSPvq
 WEqHcgOGf5LufVycN1w9VfRm7+8ntz4M2iEWl8PIwbGAiNzZyehw2NuUlsy4dR5DzH8KAMVr6BG
 wvPgti3eUv1+xl8/VRQbDzMva/WimJbcPTY5LOU53jw4+TyjNRT/6okAyNkFTqbxysE3ycNVaUe
 I65DNHVcvynrfftd2/8PVqaibQSO8GDrBTHuJGRSIgQYwgk3kDjRIAvj1l0JOmsiGWXrxiCaXyN
 9sMLdVWwY/b/JBQjm9+n4yEuLXVai5O1yABdvT8vRrdrmH0gVfv8v/4OCX92DaNLkvpmd4uAh4R
 5MQJfadO+mzB7qDMBesMurFRbOwHzybYTcTl184gn52Lak5qWd3F1CrIH5rKPxvSgbz+c+2Ra9n
 v4OfkfjekzgMFWu/YsQ==
X-Proofpoint-GUID: tJdSxMiWSGA5-qc9hil_NmhEhpgZX5-t
X-Proofpoint-ORIG-GUID: tJdSxMiWSGA5-qc9hil_NmhEhpgZX5-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_195731_379917_CE64F95B 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCAxMDoyMOKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMDcsIDIwMjYgYXQg
MDM6NTU6NThQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEEgcGxhdGZvcm0gY2FuIGhh
dmUgbXVsdGlwbGUgQVBMSUNzIGluIGRpcmVjdC1tb2RlIHRhcmdldHRpbmcKPiA+IGRpZmZlcmVu
dCBzdWJzZXQgb2YgaGFydHMuIEFkZCBBUExJQyBJRCB0byBoYXJ0aW5kZXggbWFwIGluCj4gPiBz
dHJ1Y3QgYXBsaWNfZGF0YSB0byBjYXB0dXJlIHRoZSBzZXQgb2YgaGFydHMgdGFyZ2VkIGJ5IGEK
Pgo+IC90YXJnZWQvdGFyZ2V0ZWQvCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKUmVnYXJkcywKQW51
cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
