Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1CDCCF9EC
	for <opensbi@archiver.kernel.org>; Sun, 26 Oct 2025 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqN5Nw98wffIwdSSQbQbzznXoxHMkAZRjzpvyW2/LDs=; b=j3YMsy+vmLSZvg
	kBIb4vrYWzPdpHtOGLvYPniwbJCQzuopmXUDWmUjcKCiUQXhjvmA5OEmzgPiXpiE57Q5Li+hf8nfT
	ZhT4hEYjZHHLLq+s7orgl023ej3BnEXc+iAQvZyq49rsz4o3KZKxbkJnWRvufTXFQV7sca7nuC/D2
	JGOQ042U0ApYgtdQCeDlCrdu66rKIpid7cudOS0Q3IVUKAS9mocWiBrDNwIM9v5BEAGYD9LUDHS9r
	qMDZ9GPSzHV/ffXZhb6zK9aM0XWQbrNvBZ8KK7arTBL9+Pqp89+SByvTLgu+EFr/iPCiXGfZ7572m
	BBNRaKK5i3NcqBDjU8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I6-0000000CiXy-49tv;
	Sun, 26 Oct 2025 20:24:38 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I4-0000000CiVw-0zxW
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510274; x=1762115074; i=b.freisen@gmx.net;
	bh=nglJjNuxEFyhS1g9112b7jjHkY1kJLiiory6At8gNTA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pAzNcxMKH/RgbZ0IdI6sXxmNO+dPZ73IvJ9Yc9tFaFdL/XSrYtgggRXD3iigZwd1
	 fhas87g4lSoV1o3/dhSCe6u+sRqri5TC/abO7pksHauqIXiGVVsEgvBW1RslyDnY7
	 jO29d4mQuJuHau7JJoTpr4UJOOD6fsGJ0SHh7u3leQCSq6lNO33MNr+BAOva9cvbX
	 qHQLRwmXu6YyLwA+EUL7Yy1zwSLKFXZo0Vd2fXrluDFNGW57GJWRuujTUARHF98Jg
	 CAMpBXkQ2edYk9UPuR8u9tA8+aRvYuWG8gEgcZf/R3nJkFwiE7qAK+vWhB+vcjxak
	 46mftZpUbBjsR2uX2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybGX-1uEr6d1HVV-00xYf3; Sun, 26
 Oct 2025 21:24:34 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH 3/5] include: sbi: Make "s8" actually signed.
Date: Sun, 26 Oct 2025 21:21:57 +0100
Message-ID: <20251026202416.23550-4-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0Kclxo23+BRyhQWwxu4RcyY8DTTu4T8aeu/sL2BkOZaD19FZ8zB
 mEkdnODCnTHKxOrYzpo33fqgoxqAXkjD4nZOVOYclu12b8fKVRg35Q5TivyY77ximEvHrzP
 e5j4dDHWshuT77JTUreZa+iugBpQcuy/C1AmvvzWhrGsT528jSEI/lHJtwV+PAxJN0ea0a+
 9KyduowXMUQ1TAj3mLa5w==
UI-OutboundReport: notjunk:1;M01:P0:pvyENKn9HhU=;kpYmLGZ3n63bWqVCJym6q639HBt k/L1vwdEu3dyCXmSIO1BaOWgWLlPqBlh+JLtJdEKfrZ+afW0muJ8AfoTm52cbciUnU9ijALkL tovFlQpVbOYPomyNaX16aIBEXipH5Mrpkr2TAEAYdMKZrSuWoDRqtugRfw200ePooq3mo6VdC lK8Du2yNW2oj3gtxn4YzcRfjpdgvIRynt2nrCCEyeoERo290Pa0FCD2zCS6MW9+rQFhTeL0F6 ix4NQ5SE7gllxILT5axE1jlr34R88Wn5d+ipxIpWb7/vzuxyY/2pN07r5EiBZd6vVNK6IPAa0 eH61z68hLipOWmgVNUk7CHGhvPqqR8VPjlsl8i4PlNhtNDxmGJyrlUMS2NQNTplOZW6P9A614 2s2ud0Ao1EzjzzfV6H1wzHMJ+xgB54uNzv0oidp3Tx/4QAilSzgPiWU195k1h3ZCIp5lslZBA JEkzcvIJVxXSmhHxwV1eFMJJ0v9fucgpJK8tfx9uhWnb1WfXIemipiilSH1VF2kcH2IQYUDOO MhiSYPLoG9whEON2nWQpBBbJPGP1WBn1+CltkLYCgGiM5jG6VbxYpRkofTW6G74nR/bPjo+k/ 1plU/TtxzObwR+N7uC10A7mjR+4hgt2JPaI0RZ2v+GaVjZDZKSvPwRzLnHJYxIs0Bxe8QFsMx IjjsNct5rmqi4mTYylXncz2E0jLj7KWDpq3BpPHB6xSoEI1Porb5ssJoIxitpywK+kWgrUSIw t+XVDrvKu9WTjWhNNY/sEX/+2TZqLrbrKUlKgGKaMbq4YGTyTvh9xfb1PgG1ZNYfFpO1JVNMj u9iu2UME5czwOtuT7uKOF3v0JUtrdWLcw3UL3fJJ9vMNNmbI1MxzucB+RTePZVG9//S0DHkJU fVdBOrpvImjXhLcGEW24aHZDz0ZUYDZKVqFcTqGe0JZMVX7Uqq5LlWmf4o/+C6r7xFRXNVQQ/ RKoPSLgH69f8UUSoKpvx1NDBw+lZKQMEA/BiJyjL/RxjoY5xes24b8TJGFvPKu7KQwMVz/zp1 egD3+KTyEGTIKZKAbF5KLB/75zf6Nn6MRMbL2MZ6n2M/PDX1dEOos9rWi+RCuqhjr6WTAhwTs dlnrsOWzAzUOTv4OOTS6ijfUpwqtsd6pZJBocMI/7e4Td31Q58Z6vfi6Eebnk0DRKMRX5kEIK nOU+9tDcjVClOfxQnJkb2NxsoQvBzl3CZ+JFb+imM/jSxmsXSRvrcrt0PtQkvYBobNHU0IypM p0RPQCaxq6KWKvw+BNXJclKKx9Ma6N+lNkm842zDHfp4EszDUW8AD8I5ZVAfSfaL//43SHwTO v15QHq+NNB5sA7ZM7HkFg7JvZenbOwKwCs4ufHY4rWRbcun4sGpTam+l9nWvjYPcBMQPMr1EJ 8QnkFgDl177Aqx/Porq1W/Ld7IG0nik1slAnh88AWQm1vr44f7Vivdl91bWsBknObmNFlLgjQ Vqjm0Z9io9HyRtHYZ+OEig8L7EmMO6fdl6+PCpQGw9075crSC2V4RI3X5r9cRahpiBBl6Bxb8 eevLXOo+3l0vLKsJBTOi16mWy0XJ+Wo2u8amzF9ce3LnYktyVd8C7ntfy09oSIAKnPLy0YikX T8VfCoYlUxBpFnklmHxCuhqu+WBVFtQD2adnj3oJv5esboQg+Qg/b8+Y/tEJ8AJ+/aR1029II dzEQP3SPExEbYd3+BmksARmZFYTKFQwNJAC6DSgqSP7GM2yfRFy8oDX7W6Gcdp3JhM+VeWsUX kKteX8xoeDlm6iKSPBcHslibnCD0Gz9vCBDeeTBh+/SL/2HdwV1gk0pJeEeZkpDRsF6mo+xl9 ukjNCFcJ3OHkjpb7BLXtqFFPmKjNfL5/PoW1L2LCI08LhwmoHIzVdXlrsco7GCIDXMr5DtD+2 QU8Fkk5x3dJknlmOxg8Av/FlsJp+1swkpD4y4ZDJ6I+B3r9eFk8BUExeKeo0kHQQJos++UCI1 jqqXdqToT1ZU5V9epCQoPj6yBhAc+Ch2F2h0LNkCzVtLLnKbkI/jzRQfhEF65Q2CERMwFITvf hGwHyNblsxPEhbp1Yk+NMl/5y/XEz4WlY878wLD3KgmkUslPSjdk7gIS/F5hNtHtvxmWRi3cG osdlIXoJcZNsL1aY2fyWB+3aS50oimNPHLsSeFaMoc6dkkgNbvEShiXnLZZL+lD4IqkhNGpH1 DbGWeiaAruddeqPCCstTPXgH7L5zyQ72UrSdnyZzfWTkqF949OEzaiPTzI5jByJq+dz86kohv gyAdTRLz92lGhNr4fuKsNdJhqzCj9ZhytvL1jNpyLVQODqnutgMvYCMQSbc8xBoYjSKM0lQP3 rI13eToYvND7TjzXVgHEcd09NCQz7blaKFO0wJzoFfwSwamt/0KYHGT2TlFDwhjUn4susiGQm 5PNeJv73OutQDFTZGM6kaZNKIy3lTqfx88BtF4tdLa735W+K+a24dgNCflWuYRh6z1Bk9LI7a yv7pYJ30c4fd0R2jJa+2JX3VdfLPIi5RctnHcH1E687vv367TFMV5bOX+fTAKkifYDKHWbiCv TM2BYzS3Z87JH/nXlHoFMxaipsmzSTdaV5/7RqpjdbzlN3cJOFhPOPBCsXneTNWuqUlM9FkSK a89df76ckpne/JuBXSbnNhwr03ZRVMDgJGPsFf/uXnIsAJQe3L+L6AZn3Jh7ptw9wWrY42tTD W2bcGLxPWLBq8Q2HAMLIaL3/l6hy+IkseHaAJlezJcGP0l5wOA5iTBDy9jh2M/+lVdq0JcEdH DNBGkBFT5edtDNNTSRt3X4Lss5JuEsRYhKnu6epqUfB5u+hQ8WYjcDF7+XvyOPrCTyumhQu+F I+3EogW5t1zihO/wDf3L/x0mq8MHAmEY/C0qKFhqNuO/uXCmLL2wwZgwX6/kwpL0PfYS1ngb9 W6aYQFTnIZ1mIuT9Gw4tyP9yoZbIPy/F748+0XVS/8Gc8cMTuXjQzOP+HzQJ3D549aUodVwF+ YOSnt0it/ryBpa+ZJZ+pnBQZNaO6Nisep2XvGGgCboBvHnAlhD0YRcjnAJNkaVg+Wq2d3sUAi zReLsx1/6B/TcFGimtTX32o9p5wwYGNUFPvSjlzuHjEBEzqN/gfnJTKhb8ogfzPIT8zWgfIEe UMP/s1e2DXJTw+pDYo89BKe251pb+SEdaQuK2uLbXuNyLf9qYUqneVZQ8Jqvn8g9fTQuC56XM AlI5802K+ogLofh+vD5t3SsZEY/+6A7LWKI/+ZzXGpG44409aCOcQFBK0mHo9B+7k+0qIv5Lt WgFg7GzgpTEi5T+yJX9dXx9X7EZG+HHdrVg6yaxU2j38arwWxYiJBSKwdZVy6Pnt2PzOCS+c9 J9n86SwbYnS7x5HJJaR6uQBhzpDRrUdyAsv9P3G7RYDr9notLNmezGhHfqjwFwiphhdY1ZOti eh0cyMuIHGoJakGKjYUpPD9CeJ27p72Abe4a0/V5YF/mLQfqQnd3rhuwPnPnwo066mFaWcDVJ CGPgm2cAHWR0C3e6nQ3Qx0A7My7G2KoByg0vLVvD7zUh2kS2jIqcsTe+t4qSdF2lK980HmV9V YQEUqm9IpP6UzJ6eENsLq65rDcdlyNnRPnhElk1/yonLmaI0XIFJlLEjeMETPJhAtxW3z7yF7 /xuac5Ur9ePExwG7LZC4dRkw3pSEyoGKyrSbofMju38bxKKw8QgzGegrw1VoBcFiQNxVIfxU6 NULTBHc5n5eccMI2Rh/E8fi/EAikoOEPRX24pXrsN/rzKIPe+tnhDGxRQvWkStOoMv12REgP0 ooQWzj/kltYX/ujow+O8hc26TsIhwGjGAoJttnUnVjRjs+Ch7JHoCGAT63/EK1r2ks5LNZyqL 10z+XFnm/eLWL8TrqvBY4Tjh9/FYrYCZK+UMzzmwASn+0F+6b9AoJdnKcVkORNfMddKliC6oe
 1NNJbtpmMHKICPkos0M23KrKMCqiCYw/tQxcjywSuIhmnLHjBE6ijG6M1ZVEi/6ndHF6QIBSK MiavLlL1rsYKEefiOVaoSeMo1Hx1HSPJb+yC15t3NlMmZwkuRfqwog+DzRnzZilOpmd9jTkpE ra0bRQ7b3PjkS0e+rAtyWWeqCxkge/jP9fgegcSZbjYVd5OrtWVXppCZ6aB4TR/1uFhiCmD4Q xnTepDJEt4DaDD0DoLcK3VrOhPSLbGK2fQn9HLb+cB/UWEAQe9bg9pnK8r13LzpLxqq0FvPDm Iqh+TtedwTTSsC215Wgtr1KV7aC0w9j7wFzmZMnemEqJ3hkTVrI6jackLoCH0yDLZIS070muW mPYLlRo+NqFKlAGSkxjbG7oRdpc2aLJLm1U+rS8rQae9O531UVpkaVTqDScmub4QvnTkH9niW gyhsq/fnSgeyHMFpGWvhy1RZxw7LqvYp2nir6WGRID55ZteozjusZnCYP8D0Rq+ljHUVxRqUP S2yv1Ol/GxQrQBpCxKurT0AeIzi7bmrWMJ7ezdGrVv302Y25fkXPweGcd6JC8plGPhKpfzGsB KSYci1RaqEVLA/Jk+9zGCRCTrPFxTCkLYK0l4i3RGwHDeOmrZm8tgsYQbzlssrPPMOqAkyVBK SxntufxI7yiaUl7aWnGTPjFMST0w9nuTewSauQyg+2JVXWhvJgofvKBOFdLnBpA6v+F+pDNnv 9g+COf9reS4+XE2dZvXEsc0nvvSEo5mbeNOlTAgJTTUlJhAGTF05pCxmzC55Z0yBDzjlgU8lw N6XOW86EFWSejdMzwLyjBrk57CWqo29L7qgZGgJ9A6usrzUyh+qJPr1qW68hyG0lnb1nPmlAf sbj3VpE/3eQdZR8I7PCN8vfRcOjZ4lVwNUjMNX2TpmFDTQnYUW90g4CzRaNeoHVHDIVmSimVE jO3BE19xeix6ixx/apsKJkHrGHwJmspS+2ptUon7de9HB9JWa8GBWIvJR1HcG+mXpGIduy67G 361rmrsUOSy5OMybeGZccCaohHkcG43Pep0sXuIOYbTsJKMmGIlfAr4aFX7i0Q/9f2D8Udihq EiaKXxjtUlnvOOt1UHYw3d7qp1ZsAh2Qy/3aCdNYZdz7nD4mF+dMfsgr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132436_555002_E84B8CE2 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Since plain "char" is implicitly unsigned on RISC-V, "s8" should be an alias for "signed char".

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/sbi_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index 2637faf..b8a7e6c 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -14,7 +14,7 @@
 
 /* clang-format off */
 
-typedef char			s8;
+typedef signed char		s8;
 typedef unsigned char		u8;
 typedef unsigned char		uint8_t;
 
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
