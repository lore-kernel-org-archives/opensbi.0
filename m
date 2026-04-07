Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A089FB5192
	for <opensbi@archiver.kernel.org>; Tue,  7 Apr 2026 05:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTrSQlPF3s7o38CqRVCzDG0hXtpFeBfvWM7g8dYN09g=; b=Vttk9NqxlVXzYb
	uaKVO43Xg9VY8ut0HuPuDATHkYarsQ6XGQzQ0eFDb1ztB5iWwjPYmVvbJHutTCjdwZjxBI5kJHIRO
	R0EkGySGhZE6DKjuW5By0WRvqvF2s8W9EEBEpcJjQ/v4h9gLkb1RTRTbMbRBXC+YsiPBz4W5eyp8Q
	0WqTTuGi/XBbc6iq5OVdI6dkJRR+sg4CetbK3HQM0BL4uMexRMECr+dvDjRz6zyCOPCpfbj7Ajrr3
	JguYSl8ZTzIi9aBV5JjHUhJH3nQy9L/4GtoXLyVBYJGKB6gYXN39WD1AEJMJDHpBYesc6r5Mm843u
	6kOPQ1hyJpvKbygO3y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ytw-00000005uOD-2DoI;
	Tue, 07 Apr 2026 05:23:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ytt-00000005uNo-1ZoU
	for opensbi@lists.infradead.org;
	Tue, 07 Apr 2026 05:22:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LSg7Q2580035
	for <opensbi@lists.infradead.org>; Tue, 7 Apr 2026 05:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5asCHnnnku9fIrnJCpjRjDogLCerZ7Fqs4UX3tLlAbk=; b=d64FjLQtbMz/3aGW
	PChk6grvQbwVHtwSHrwoydqGc+QAFAyMEho3UbSKU6Liah6ICiDUHU6SCFpdQ52t
	YsIFytKrZeigomao0rEwrJ9HF2avtZKgYx33fipk4zSR1i+sx+2y4P941sdYms7l
	+SGY8LXVvJZb9dO/LAKVsjBsFbi21bC9lnSztrjkWAkcVBPjGwDOyLeFOomEmgeM
	QX3z27peJB4c+WICIL27QUaMKhxmtWq26YVTJDZzHl/X9zSyIjZRw2Pz81K5SF5L
	hWZYlLmzwIjlQFvOTVBFR576RNrkErYAqXDkBE8acqOMDhWnrOZ3xmT9ITfVGGFV
	fGwCHQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf150c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 07 Apr 2026 05:22:55 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-41c02dec5c1so11034653fac.2
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 22:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775539375; cv=none;
        d=google.com; s=arc-20240605;
        b=DFb1oiwjR5M2f1qzikDfdIRww57TuD28RQirZRqbCBZlKAuajqn7gMBMq7N4+eqqCU
         lBb2gzvGlb5OVEN/KVWwxSOppUpSMysQMTtFGprTOtmBEa4B6F9FtOanbNGOGbEvcxx5
         +AO3c7m2fcm7Pd+wD/ahPLbu8i1yuAIKRNoWQ7cv9TxOwCevuPzeXtg7fVs7Z6X7Ucz1
         1iXT8+diS2PC5bwkgRWbNTFnYSDzVDjXY98pbE0okoc+hkjk3eGQeo8Ebbc0c5IgM1yG
         1h1EyDQAeZtJZwvYCThJR7u00KBTBL8Gkz+cf+qZ9C8JyxnSp7d2mA3XBrsdC6pBlw/W
         +iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5asCHnnnku9fIrnJCpjRjDogLCerZ7Fqs4UX3tLlAbk=;
        fh=n2TGyUk3XYwKAA+BJuo6rCuEyELyezizubQW0/X4FhU=;
        b=WkOKT1xljTHVs2LBaklGSC6H1przhkY9s22YvtsHDJ8/EVv4cqP3Nv0JPuQIUXni5x
         XaMCO0wk+FU3+5LrQTVuCdcJSXnglFZmoiCrddVJurOWTUwViKrz7nInLqux9DKUogm8
         qs262n2p8V/Fb2iEe/E/mi0QbPsmj6VQKuzFNnzM/p0P2o/BB/7uhjrhR6KR9wU4zlXn
         vNgj7kqUMbA7qrtf4erYjwTpKmxUy6VptcQK1yGD4DCMMN1UiIHFLbRGEN5zg3iXfdfq
         YAL3acwuKTjpUfvoV/SQNs53bAV/nJ3PV0BNbii/hkoNsCaMTPn3K5oi3+/PXBR2WLvS
         PzPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539375; x=1776144175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5asCHnnnku9fIrnJCpjRjDogLCerZ7Fqs4UX3tLlAbk=;
        b=Dr6tEu5azd+xLOFFmCnE7XOCJREa81sKgjxMnTVHhbqyaixfKxBc7jAHPJLkFnFhyg
         59JhV5ze3NUnbImcdhXcqtufi+89EbZU6kSXzt+KJZlvMUr6SG7qKAgIz8IM5SPz/hC4
         smUrgHAg/o8j5sf4CvBWgxKWaSNdHn8HSOBoKapB0kt5MmPaLxInqRRRWHZI8Ql/fe1R
         vF3Epex73leJYWRyYARcAGtx/04YboSa2+UpQQAHOjyjY4S879BZPP9N1LN+vw+8xcSe
         JxecaI7juHl3wT9DdsWmwFTeWsQcvXiC8A1CthZyMT4PDp+UQ/SwpyH74xESmOWl9Ui5
         nIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539375; x=1776144175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5asCHnnnku9fIrnJCpjRjDogLCerZ7Fqs4UX3tLlAbk=;
        b=AvQU/lvEssjnC91cgrsMYSsASdeq2KSATqHoO6MykqtfgrTUez9l8t2uWS+SRwJ/cH
         UhPvSqh7jBpUWHF7t+rjvBDNshp/Lpoxmy0Kfv5Fgy7uNoeKbEWuYlEzmWn/7zEZmkRa
         1RAfrgloVtFa7bFwUjzYSqv5ylds7HsMnJSKDr/IXLAf3/2PjvBhaR68xTovtrLc3tTH
         Jo1nlkwgXjLJ2tm8cvD8e5OVhtb/7IuDpU3je8DkuvHBHVterGgzZ8ra5TfDg+RfLc/y
         sWV0AP9knBd6jw0UhLUcVd5XKFMOCCP63LfXJQXifXrZ9uKK6QU+/4sZfBf57so2kO6E
         5GYA==
X-Gm-Message-State: AOJu0Ywjd4+bHyNJ7KjizFRA36ah+mGF/e5f3Qp/Frnqn7jGhWkYS4Uz
	VZdkAlmr7L1TnBoqcawrrNvw1MRVMyA8/52Fior6tAIUhXnfVWvQ8rzl5/hEsvTjnCUQI7AxDDD
	CmLtclKdnZF7JpBvUz2wVLks4/F+PafaUHs0Z/6c0z+9m42jwXXC+plZSq7FU1//L/8/hDaMNvV
	VCdK3lpRQRHM6kqKZGl9eD0vwg/BSku8fsQnhQJnY+
X-Gm-Gg: AeBDieuTzf1dOJ4ruuWjQx/QCLg4jsDGbk3qCLHuUxrBIQ8NDFPgkM+z6zp7YvLkOB8
	/f1ZXKv9dZzsEJkx4bTQXmQOqq7WXoxhsHqTW90k9tTe7Y2KQjjf7Cwr4xx+zW2UM1I1hfCMQW0
	9AbIUJiMJXXCT9tGd78ed4BXsHal9NQrMyxLixN1NmBCRbM38reUw4n1Qyrf7/23BTyf5ygMA5h
	Za8K5oi
X-Received: by 2002:a05:6870:c1cd:b0:417:5aa1:bc9f with SMTP id 586e51a60fabf-4230ffc0de5mr8446960fac.26.1775539375345;
        Mon, 06 Apr 2026 22:22:55 -0700 (PDT)
X-Received: by 2002:a05:6870:c1cd:b0:417:5aa1:bc9f with SMTP id
 586e51a60fabf-4230ffc0de5mr8446945fac.26.1775539374942; Mon, 06 Apr 2026
 22:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260313051948.4017134-1-npiggin@gmail.com> <20260313051948.4017134-2-npiggin@gmail.com>
In-Reply-To: <20260313051948.4017134-2-npiggin@gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:52:43 +0530
X-Gm-Features: AQROBzDCBYb1xLnL8S6V4FY0YcfhKvoeZ7KGGPWJykxKByClcYGxZTMp5sFuHcg
Message-ID: <CA+Ht8=Zo_KAunSA4wDpD808PeNuRX0PTkqo9GaMK48OinJ7zDw@mail.gmail.com>
Subject: Re: [PATCH 01/18] dbtr: Add consistent range checks to trigger ecalls
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OCBTYWx0ZWRfX3NrCzeYhqvrw
 /dquEVwvPTLZJU/GNngOJyZIK72nhU5ltKTXi3lvb4G10miEXjSs95+27NlAqM3vRgP0As9XfCY
 2R0K7dEChajTQxefbGqcaiH0XXmU1k7qKFHkdNXjLJsUZQcfY0L9hg3bB9yesycjLws/WkMm2lJ
 aZxD7J6m0UfRoumGOnWtp8YQ7HYKPrs8hFra4wuwjSoX2Q3dRn/vX8S5bSx0LUOcNTG3i5GFN3p
 RF9abcNFUPOkcMyvuMU1sMK8e00JPPry7jFylyZ3e5w+AKEviMH9QmEEP1yz0u7MFPmn998Vwh1
 6FSYQQrqApV0nLkMjWvT4EKLewdodUUkek7+NLEwxSzKCoCPREubeKoED7HjJJ1Q6IQbMSWU5XD
 p+mLv7loKpqmoMDIos3lE7p/OaMC309EbVPv/Qu/KgdbP+MY70CnHHrgTO4KJ+udqD1TvRWfjqU
 iADHjX8l1O6ZTAar3Kg==
X-Proofpoint-ORIG-GUID: 0Yb3eQHe_8-lSKGqJ5-a9RuA4CD9QK_x
X-Proofpoint-GUID: 0Yb3eQHe_8-lSKGqJ5-a9RuA4CD9QK_x
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d494af cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=1K4dGov0XeJHZKlPkHYA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222257_646400_69BAF776 
X-CRM114-Status: GOOD (  17.21  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMTA6NTDigK9BTSBOaWNob2xhcyBQaWdnaW4gPG5waWdn
aW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEJlIG1vcmUgY29uc2lzdGVudCB3aXRoIHRoZSBzZXF1
ZW5jZSBvZiB0cmlnZ2VyIHJhbmdlIGNoZWNrcyBpbiBkYnRyCj4gZWNhbGwgaGFuZGxlcnMuIFRo
aXMgaW5jbHVkZXMgYWRkaW5nIGEgbWlzc2luZyByYW5nZSBjaGVjayBpbiBpbnN0YWxsCj4gdHJp
Z2dlcnMgdGhhdCBjYW4gcmVzdWx0IGluIFNCSSBwYXN0IHRoZSBlbmQgb2YgdGhlIHNobSByZWdp
b24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29t
Pgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kYnRyLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZGJ0ci5jIGIvbGliL3NiaS9zYmlfZGJ0ci5j
Cj4gaW5kZXggOGJjYjQzMTIuLmIwMTYwMTYzIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2Ri
dHIuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RidHIuYwo+IEBAIC01NTAsNiArNTUwLDkgQEAgaW50
IHNiaV9kYnRyX3JlYWRfdHJpZyh1bnNpZ25lZCBsb25nIHNtb2RlLAo+ICAgICAgICAgaWYgKCFo
cykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfRkFJTEVEOwo+Cj4gKyAgICAgICBp
ZiAodHJpZ19jb3VudCA+PSBocy0+dG90YWxfdHJpZ3MpCj4gKyAgICAgICAgICAgICAgIHJldHVy
biBTQklfRVJSX0JBRF9SQU5HRTsKPiArCj4gICAgICAgICBpZiAodHJpZ19pZHhfYmFzZSA+PSBo
cy0+dG90YWxfdHJpZ3MgfHwKPiAgICAgICAgICAgICB0cmlnX2lkeF9iYXNlICsgdHJpZ19jb3Vu
dCA+PSBocy0+dG90YWxfdHJpZ3MpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lO
VkFMSURfUEFSQU07Cj4gQEAgLTU5NCw2ICs1OTcsOSBAQCBpbnQgc2JpX2RidHJfaW5zdGFsbF90
cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gICAgICAgICBpZiAoIWhzKQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VSUl9GQUlMRUQ7Cj4KPiArICAgICAgIGlmICh0cmlnX2NvdW50ID49
IGhzLT50b3RhbF90cmlncykKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfQkFEX1JB
TkdFOwo+ICsKPiAgICAgICAgIGlmIChzYmlfZGJ0cl9zaG1lbV9kaXNhYmxlZChocykpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX05PX1NITUVNOwo+Cj4gQEAgLTY2Myw2ICs2Njks
MTEgQEAgaW50IHNiaV9kYnRyX3VuaW5zdGFsbF90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhf
YmFzZSwKPiAgICAgICAgIGlmICghaHMpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJS
X0ZBSUxFRDsKPgo+ICsgICAgICAgaWYgKHRyaWdfaWR4X2Jhc2UgPj0gaHMtPnRvdGFsX3RyaWdz
IHx8Cj4gKyAgICAgICAgICAgICAgIGZpbmRfbGFzdF9iaXQoJnRyaWdfaWR4X21hc2ssIGhzLT50
b3RhbF90cmlncykgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJpZ19pZHhf
YmFzZSA+PSBocy0+dG90YWxfdHJpZ3MpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJS
X0lOVkFMSURfUEFSQU07Cj4gKwo+ICAgICAgICAgZm9yX2VhY2hfc2V0X2JpdF9mcm9tKGlkeCwg
JnRyaWdfbWFzaywgaHMtPnRvdGFsX3RyaWdzKSB7Cj4gICAgICAgICAgICAgICAgIHRyaWcgPSBJ
TkRFWF9UT19UUklHR0VSKGlkeCk7Cj4gICAgICAgICAgICAgICAgIGlmICghKHRyaWctPnN0YXRl
ICYgUlZfREJUUl9CSVRfTUFTSyhUUywgTUFQUEVEKSkpCj4gQEAgLTY4OCw2ICs2OTksMTEgQEAg
aW50IHNiaV9kYnRyX2VuYWJsZV90cmlnKHVuc2lnbmVkIGxvbmcgdHJpZ19pZHhfYmFzZSwKPiAg
ICAgICAgIGlmICghaHMpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxFRDsK
Pgo+ICsgICAgICAgaWYgKHRyaWdfaWR4X2Jhc2UgPj0gaHMtPnRvdGFsX3RyaWdzIHx8Cj4gKyAg
ICAgICAgICAgICAgIGZpbmRfbGFzdF9iaXQoJnRyaWdfaWR4X21hc2ssIGhzLT50b3RhbF90cmln
cykgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJpZ19pZHhfYmFzZSA+PSBo
cy0+dG90YWxfdHJpZ3MpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURf
UEFSQU07Cj4gKwo+ICAgICAgICAgZm9yX2VhY2hfc2V0X2JpdF9mcm9tKGlkeCwgJnRyaWdfbWFz
aywgaHMtPnRvdGFsX3RyaWdzKSB7Cj4gICAgICAgICAgICAgICAgIHRyaWcgPSBJTkRFWF9UT19U
UklHR0VSKGlkeCk7Cj4gICAgICAgICAgICAgICAgIHNiaV9kcHJpbnRmKCIlczogZW5hYmxlIHRy
aWdnZXIgJWx1XG4iLCBfX2Z1bmNfXywgaWR4KTsKPiBAQCAtNzEwLDE0ICs3MjYsMTQgQEAgaW50
IHNiaV9kYnRyX3VwZGF0ZV90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gICAgICAgICBpZiAo
IWhzKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9GQUlMRUQ7Cj4KPiArICAgICAg
IGlmICh0cmlnX2NvdW50ID49IGhzLT50b3RhbF90cmlncykKPiArICAgICAgICAgICAgICAgcmV0
dXJuIFNCSV9FUlJfQkFEX1JBTkdFOwo+ICsKPiAgICAgICAgIGlmIChzYmlfZGJ0cl9zaG1lbV9k
aXNhYmxlZChocykpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX05PX1NITUVNOwo+
Cj4gICAgICAgICBzaG1lbV9iYXNlID0gaGFydF9zaG1lbV9iYXNlKGhzKTsKPgo+IC0gICAgICAg
aWYgKHRyaWdfY291bnQgPj0gaHMtPnRvdGFsX3RyaWdzKQo+IC0gICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VSUl9CQURfUkFOR0U7Cj4gLQo+ICAgICAgICAgZm9yX2VhY2hfdHJpZ19lbnRyeShz
aG1lbV9iYXNlLCB0cmlnX2NvdW50LCB0eXBlb2YoKmVudHJ5KSwgZW50cnkpIHsKPiAgICAgICAg
ICAgICAgICAgc2JpX2hhcnRfcHJvdGVjdGlvbl9tYXBfcmFuZ2UoKHVuc2lnbmVkIGxvbmcpZW50
cnksIHNpemVvZigqZW50cnkpKTsKPiAgICAgICAgICAgICAgICAgdHJpZ19pZHggPSBlbnRyeS0+
aWQuaWR4Owo+IEBAIC03NTQsNiArNzcwLDExIEBAIGludCBzYmlfZGJ0cl9kaXNhYmxlX3RyaWco
dW5zaWduZWQgbG9uZyB0cmlnX2lkeF9iYXNlLAo+ICAgICAgICAgaWYgKCFocykKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FUlJfRkFJTEVEOwo+Cj4gKyAgICAgICBpZiAodHJpZ19pZHhf
YmFzZSA+PSBocy0+dG90YWxfdHJpZ3MgfHwKPiArICAgICAgICAgICAgICAgZmluZF9sYXN0X2Jp
dCgmdHJpZ19pZHhfbWFzaywgaHMtPnRvdGFsX3RyaWdzKSArCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0cmlnX2lkeF9iYXNlID49IGhzLT50b3RhbF90cmlncykKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiArCj4gICAgICAgICBmb3Jf
ZWFjaF9zZXRfYml0X2Zyb20oaWR4LCAmdHJpZ19tYXNrLCBocy0+dG90YWxfdHJpZ3MpIHsKPiAg
ICAgICAgICAgICAgICAgdHJpZyA9IElOREVYX1RPX1RSSUdHRVIoaWR4KTsKPiAgICAgICAgICAg
ICAgICAgZGJ0cl90cmlnZ2VyX2Rpc2FibGUodHJpZyk7CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2
aWV3ZWQtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21t
LmNvbT4KCj4gLS0KPiAyLjUxLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
