Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B2C982ED
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkcZsta3Y+I48QPmJ3Zzo/lBqG47I62e/pF1O+ApJA8=; b=jIGptw5Xlhl+CX
	t61W30PBg8gG8g/cnN2ZVWxTeWoU/Izyo+/Pqffm3Ln46YOXpUg3f4ek40x1rMrQtgi6mRomBlBP+
	9hWSG1Iz+CX00g0i0pUjs8gYxxrZt/qLc6fbRKWhbJ8AZt4MU0MOK0QPP5C3o1y2MTLI29sFGxhTW
	tcpMNVK4iDU6yJp3R+1xJ/yIZInKI+GYIrt3ieZKeOm8doPf6QiJslRZ3B/YSVr7NFTWb/InD5jUk
	bByipgMZIRzEqZDRKJsN2DMSWNTvKGrwa4S5plwzQajm88G4bEs6jllJoOWVCNfSKl5usQ0ZYtYmF
	KiBpBBYHW8fBNg9smbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ckE-00000001zuS-1rqQ;
	Mon, 21 Sep 2026 12:03:38 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ckC-00000001ztb-0ic2
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 12:03:37 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso2271508f8f.2
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 05:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789992214; cv=none;
        d=google.com; s=arc-20260327;
        b=cYPG7lrktMC9ieVKJ/YQSHL0uhRtHyUQUR/ehcEoGq230aERB/W41CrebOebXdMI6n
         ggdaeqkG+PcHOJNl2bl8UOhTNd4IKm5w42YDX1EE/UiZ+W3HQc25k882xBvkmLt3xzYk
         W7xW+kCT4V1Pt2bxmEyrDtQ1BE3Tjlopzzs0KCOC0BmY9KNX3WraIIafeAMZJ/WKvZ3E
         SgJqiPS8Jzf2Tr4IN3ADHq2hRzZlbiBuTOQUhln4ogY6cr6vPmxZFdJSG4w2biSrTOKN
         S1d6/phI5An4I/3jEA1TCOpEwuWQiwZvnILQ9mDnMDLx985mUqxuzArWi6i43IA3obiU
         fnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hMhq8tfUIQHCSkViF518d6oz4FI0yeZbjfidlVTZUu4=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=M9LsLsgU/Oc90xoMCvIEx73CZ6X63EQoHYaqlfEtGDFxBO6QH162Za1Qdcmx2BsOV5
         5iH9udkW/ttaktm1yIfJlzPLfzAO7DWBWumkkSphz4T5kJXZiPfbVSWMZ7VOFiXrbeBd
         OMOBYLQ9qrk3rAetwgOt0ztdYtVbTwv/JvyQCbzoUmjbEIe/tjJiAIB9p/UOPYe1sb9m
         MFpQn6is/05Rse62ePB0Qj/zJIkogCm7FCDa63+eOF+j+Djnue8mQMNDaJY/L443gWIL
         CIqo6zvP2/6cioKgKHoagEQZZZbWsoN8+/yk8a7xtWcUGLfgCaTMmuVlMy7F0Dw+X2o5
         2dag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789992214; x=1790597014; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMhq8tfUIQHCSkViF518d6oz4FI0yeZbjfidlVTZUu4=;
        b=JMX0j2qWKf/qB8YLjEnWKUshnm0c+SYycxAJ4cREzyS8mwxIfWKh5Qlkpelw4HuX7W
         5hwpi9yfWyowjJsb+FDnx+wgAc+O+mClmtdTmAupWSXF2lCZ1GkrrC33U/V0PBRf5Xa/
         8riQEjz6f/dfBRjK+FPYjZ57jw0paZZgCYqdQapCJAV1U29SpbzMAYD01QuOtvJBUnO5
         o1q360+NcfJcX18ZXDXoM5uuAGBAMis2TZOi8PMoPcqz27j5Z7JxEkRhM/VpS0DZpbP4
         cowOCqOQHQKynj6J44Cr4CCK9DUnkhXDs2bj21+Nd1j+8TvoaPaKEMbDRfejFWkC3Sbf
         H4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992214; x=1790597014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMhq8tfUIQHCSkViF518d6oz4FI0yeZbjfidlVTZUu4=;
        b=FUyNQOpUexqH8Y5gM/pxfx6wxZNWUBotfVcQytmSkZl/FTj/xnF13gKotHVSVrrBAF
         S0mV0fTOZVD91kW+9JtPS28VEcy6hgYyqK49pwc+NnbWM4JnCdgwmhTUTjnFtIXxOVF9
         ML38OoeW4b7r2yw1yhRyEp8OeaRw4ltBtAOf+301nu69WC2OuQlRrj1ksjoAtaJA9jeC
         ZyNHX0tpag+MUq2KZSLJWTfLxD8CC4gtSfJBaD/DU6x8FxAMZZ/OCkyoILacdv46nCxK
         aW/bbHcCidVoHu7RnCpDmO50gEpeTJu2JmZFTwNDS8xgri3nhly6U1SP3hC4njpJaUBP
         aULA==
X-Gm-Message-State: AFuF++lPt/wtml9mUk7WOnSou+6oHUHye9QfBy83X/+hwWjIbufR9P+1
	kr/53YwEXZ3bPHrxt0GyiDdnMNLFKYtWCPa1rkRMeipJ8dmomJUbzcb4oAVL9pQKaPFrSG60VeV
	AmmxX+fmIfkmVLLIeN2o/xCpWpMtJDRDHjoXbcrL5Dw==
X-Gm-Gg: AYBFou0ReChpCcX5NGW88rWsJEG8XqsXk1+nTw/hQ9hLJurgpU/tOZqt0fl5Erh1OOr
	rU9/hbEFVk0XkL0TakoF8WGnXhk6w/KvgBvyEEK5sGBFDiQ2DAPlejsRjrDuO0aWA7U0H8gUUnI
	khl2LMwFlaQ+Myo47nvhh6oy+tc4C2+3+BpG5IexkK8EZQ0JddLEzAwuwQgws/+Iy0OySb2bju0
	lAnSbDRcp64TckyB72UT5MySZvspdaRaePhKNY3Uo9c1R+92u0AMe8HXq4/auA7589V38PXKGqH
	4tT0bJb4I8xhqPL1y+av0BRu2hzEg0C52fB8p2dSxD1j8zqqfnhNdcEScvYDXNDWzREr1Op2YIP
	auUB1VarlLxtiSfcGf6rECNiFh/yKpFl2xFpwLxIjSJDn/TW+40L+mtv8YiXK9kcZ1b5VHjb/9S
	s=
X-Received: by 2002:a05:6000:4203:b0:487:27f9:831 with SMTP id
 ffacd0b85a97d-48727f90b5amr7896288f8f.38.1789992213234; Mon, 21 Sep 2026
 05:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com> <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Sep 2026 17:33:22 +0530
X-Gm-Features: AcwNN1UbZ4-TGpqBM6fhtl8jmULUg7LGMCgYKpj_nYckyIM6IquoYJsObc02hXI
Message-ID: <CAAhSdy2bkWfLsGQAhAxgEPw-a5wJcak=8yMjDr38_cnqiEy0Ww@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib: sbi: domain: add domain registration notifier infrastructure
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_050336_269557_11829A6E 
X-CRM114-Status: GOOD (  19.92  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjozOOKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBJbnRyb2R1Y2UgYSBub3RpZmllciBj
YWxsYmFjayBtZWNoYW5pc20gdGhhdCBhbGxvd3Mgc3Vic3lzdGVtcyB0bwo+IHJlZ2lzdGVyIGlu
dGVyZXN0IGluIGRvbWFpbiByZWdpc3RyYXRpb24gZXZlbnRzLiBXaGVuIGEgbmV3IGRvbWFpbgo+
IGlzIHJlZ2lzdGVyZWQgdmlhIHNiaV9kb21haW5fcmVnaXN0ZXIoKSwgYWxsIHJlZ2lzdGVyZWQg
bm90aWZpZXJzCj4gYXJlIGludm9rZWQgYmVmb3JlIGRvbWFpbiBzYW5pdGl6YXRpb24uCj4KPiBU
aGUgZm9sbG93aW5nIHB1YmxpYyBpbnRlcmZhY2VzIGFyZSBhZGRlZCB0byBzYmlfZG9tYWluLmg6
Cj4KPiAgIC0gc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcigpOiByZWdpc3RlcnMgYSBub3Rp
ZmllciBjYWxsYmFjay4KPiAgICAgRHVwbGljYXRlIChmbiwgcHJpdikgcGFpcnMgYXJlIHNpbGVu
dGx5IGlnbm9yZWQuCj4KPiAgIC0gc2JpX2RvbWFpbl91bnJlZ2lzdGVyX25vdGlmaWVyKCk6IHJl
bW92ZXMgYSBwcmV2aW91c2x5IHJlZ2lzdGVyZWQKPiAgICAgbm90aWZpZXIgY2FsbGJhY2suCj4K
PiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29t
bS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCB8IDEwICsrKysrKysKPiAg
bGliL3NiaS9zYmlfZG9tYWluLmMgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9t
YWluLmgKPiBpbmRleCBiMzVlYTk5Zi4uMjQ3MWRmNDggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9z
Ymkvc2JpX2RvbWFpbi5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTM1
OCw0ICszNTgsMTQgQEAgaW50IHNiaV9kb21haW5fZmluYWxpemUoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKTsKPiAgLyoqIEluaXRpYWxpemUgZG9tYWlucyAqLwo+ICBpbnQgc2JpX2RvbWFp
bl9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGNvbGRfaGFydGlkKTsKPgoK
RGVmaW5lICJlbnVtIHNiaV9kb21haW5fbm90aWZpZXJfZXZlbnQiIGhlcmUuCgo+ICsvKiogTm90
aWZpZXIgY2FsbGJhY2sgKi8KPiArdHlwZWRlZiB2b2lkICgqc2JpX2RvbWFpbl9ub3RpZmllcl9m
bikoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpwcml2KTsKCkFkZCAiZW51bSBzYmlfZG9tYWluX25vdGlm
aWVyX2V2ZW50IGV2ZW50IiBwYXJhbWV0ZXIgdG8gbm90aWZpZXIgY2FsbGJhY2suClRoaXMgd2F5
IGNhbGxiYWNrIGNhbiBkaWZmZXJlbnRpYXRlIHRoZSBldmVudHMuCgo+ICsKPiArLyoqIFJlZ2l0
c2VyIGRvbWFpbiBub3RpZmllciAqLwo+ICtpbnQgc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmll
cihzYmlfZG9tYWluX25vdGlmaWVyX2ZuIG5vdGlmaWVyLCB2b2lkICpwcml2KTsKPiArCj4gKy8q
KiBVbnJlZ2l0c2VyIGRvbWFpbiBub3RpZmllciAqLwo+ICtpbnQgc2JpX2RvbWFpbl91bnJlZ2lz
dGVyX25vdGlmaWVyKHNiaV9kb21haW5fbm90aWZpZXJfZm4gbm90aWZpZXIsIHZvaWQgKnByaXYp
Owo+ICsKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGli
L3NiaS9zYmlfZG9tYWluLmMKPiBpbmRleCA3NDdjMzQ2Yy4uOTlmMjAxY2YgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBA
IC0zNiw3ICszNiw2NSBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiByb290ID0gewo+ICAgICAgICAgLmZ3
X3JlZ2lvbl9pbml0ZWQgPSBmYWxzZSwKPiAgfTsKPgo+ICtzdHJ1Y3Qgc2JpX2RvbWFpbl9ub3Rp
Zmllcl9lbnRyeSB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2RsaXN0ICAgICAgICBub2RlOwo+ICsg
ICAgICAgc2JpX2RvbWFpbl9ub3RpZmllcl9mbiAgZm47Cj4gKyAgICAgICB2b2lkICAgICAgICAg
ICAgICAgICAgICpwcml2Owo+ICt9Owo+ICsKPiArCgpSZWR1bmRhbnQgbmV3bGluZS4KCj4gIHN0
YXRpYyB1bnNpZ25lZCBsb25nIGRvbWFpbl9oYXJ0X3B0cl9vZmZzZXQ7Cj4gK3N0YXRpYyBTQklf
TElTVF9IRUFEKGRvbWFpbl9ub3RpZmllcl9saXN0KTsKPiArCj4gK2ludCBzYmlfZG9tYWluX3Jl
Z2lzdGVyX25vdGlmaWVyKHNiaV9kb21haW5fbm90aWZpZXJfZm4gbm90aWZpZXIsIHZvaWQgKnBy
aXYpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzYmlfZG9tYWluX25vdGlmaWVyX2VudHJ5ICplbnRy
eTsKPiArCj4gKyAgICAgICBpZiAoIW5vdGlmaWVyKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiArCj4gKyAgICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShlbnRyeSwg
JmRvbWFpbl9ub3RpZmllcl9saXN0LCBub2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChlbnRy
eS0+Zm4gPT0gbm90aWZpZXIgJiYgZW50cnktPnByaXYgPT0gcHJpdikKPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gU0JJX09LOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGVudHJ5
ID0gc2JpX3phbGxvYyhzaXplb2YoKmVudHJ5KSk7Cj4gKyAgICAgICBpZiAoIWVudHJ5KQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPiArCj4gKyAgICAgICBlbnRyeS0+Zm4g
ICA9IG5vdGlmaWVyOwo+ICsgICAgICAgZW50cnktPnByaXYgPSBwcml2Owo+ICsgICAgICAgc2Jp
X2xpc3RfYWRkX3RhaWwoJmVudHJ5LT5ub2RlLCAmZG9tYWluX25vdGlmaWVyX2xpc3QpOwo+ICsg
ICAgICAgcmV0dXJuIFNCSV9PSzsKPiArfQo+ICsKPiAraW50IHNiaV9kb21haW5fdW5yZWdpc3Rl
cl9ub3RpZmllcihzYmlfZG9tYWluX25vdGlmaWVyX2ZuIG5vdGlmaWVyLCB2b2lkICpwcml2KQo+
ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9ub3RpZmllcl9lbnRyeSAqZW50cnksICp0
bXA7Cj4gKwo+ICsgICAgICAgaWYgKCFub3RpZmllcikKPiArICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FSU5WQUw7Cj4gKwo+ICsgICAgICAgc2JpX2xpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShl
bnRyeSwgdG1wLCAmZG9tYWluX25vdGlmaWVyX2xpc3QsIG5vZGUpIHsKPiArICAgICAgICAgICAg
ICAgaWYgKGVudHJ5LT5mbiA9PSBub3RpZmllciAmJiBlbnRyeS0+cHJpdiA9PSBwcml2KSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2JpX2xpc3RfZGVsKCZlbnRyeS0+bm9kZSk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc2JpX2ZyZWUoZW50cnkpOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBTQklfT0s7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiAr
Cj4gKyAgICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPiArfQo+ICsKPiArdm9pZCBzYmlfZG9tYWlu
X25vdGlmeV9hbGwoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiArewo+ICsgICAgICAg
c3RydWN0IHNiaV9kb21haW5fbm90aWZpZXJfZW50cnkgKmVudHJ5Owo+ICsKPiArICAgICAgIHNi
aV9saXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmZG9tYWluX25vdGlmaWVyX2xpc3QsIG5vZGUp
IHsKPiArICAgICAgICAgICAgICAgaWYgKGVudHJ5LT5mbikKPiArICAgICAgICAgICAgICAgICAg
ICAgICBlbnRyeS0+Zm4oZG9tLCBlbnRyeS0+cHJpdik7Cj4gKyAgICAgICB9Cj4gK30KPgo+ICBz
dHJ1Y3Qgc2JpX2RvbWFpbiAqc2JpX2hhcnRpbmRleF90b19kb21haW4odTMyIGhhcnRpbmRleCkK
PiAgewo+IEBAIC02NTAsNiArNzA4LDcgQEAgaW50IHNiaV9kb21haW5fcmVnaXN0ZXIoc3RydWN0
IHNiaV9kb21haW4gKmRvbSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VB
TFJFQURZOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBzYmlfZG9tYWluX25vdGlmeV9hbGwoZG9t
KTsKPiAgICAgICAgIC8qIFNhbml0aXplIGRpc2NvdmVyZWQgZG9tYWluICovCj4gICAgICAgICBy
YyA9IHNhbml0aXplX2RvbWFpbihkb20pOwo+ICAgICAgICAgaWYgKHJjKSB7Cj4gLS0KPiAyLjQz
LjAKPgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
