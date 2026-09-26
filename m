Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6619EC98318
	for <opensbi@archiver.kernel.org>; Sat, 26 Sep 2026 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vP+sDjhkUxwPkiK+Hp3DaHanJFylSu0UYWxAUGGQPPs=; b=iOIfGS548KCZF1go+6iiXj/Aub
	+PBtOjbqKQP7YirQO0JN7Y8G86WNbPZtJigCFZBh1wcaZ3C0koNPoFOWX46FpKXUzHRWA8+VSxsYp
	FWpG/DPeJDPi67xwXJzje3c0My0YBmtJXDUemcs4Tx/9YIb2ZCayfRqDh7u7wsGYaJiSxoay5elBm
	q65y7tZyfhWHIML7cpiGUdJYJXMiTKxHH1F10+aCT+PnwcG343zXLx69aTz6gioC5IzQjjkgYooWY
	WDAq43MIJVvZFhJHZE+P6s/v6aVR05l1y8p2eZFq3a9PUiZrdHWWv12o2gXCIgMWJym8qaBT6FgYM
	XpgZ7emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOsD-0000000FDmJ-0J4Z;
	Sat, 26 Sep 2026 09:39:13 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOsA-0000000FDlp-0ryh
	for opensbi@lists.infradead.org;
	Sat, 26 Sep 2026 09:39:11 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so2677086a12.1
        for <opensbi@lists.infradead.org>; Sat, 26 Sep 2026 02:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790415548; cv=none;
        d=google.com; s=arc-20260327;
        b=YF4XxR1tHGXfdyii21bUZ/S1JNxFPanulWOSkjpOMWs2W/o+Z4RjvwA2nX9GIEVCOT
         2DQzHSDp29TqKqVIePwAjFaJmV9l5sIo/uHt+jc5V978X4u3sovJEvNg09lPc49woOBz
         8buSTgAA4gryL5rPTzAivqQiTtU8NKGRbdXeXQrk15goGtMwysRbKB5wKH7Y+jnHyj+H
         O/gBxGEXaUmU+3kTiVScVktcb6/3I7+wpLgwyuFxM2L3WyDFIrFjGXvQ2DeRsPyXUo+I
         ZTAE5FL9BhY4hMU0MaO9z+QU7JXojvhqb9LNCcGfqYrb6HqGlGuS/H+5YZUr2X2GUK1/
         cmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YnoEa8nIBlb12uQdVO70Zdurzs3LLhT9E/NYHqgSUgc=;
        fh=CaiZLW5DectSqJqbMEJSPBNeT9GEJfanteVMmohRTSI=;
        b=jkhAsbEqf8WysB996boIKiOg/Vdf0K7BmCDhu6H2DvLl3hwyRRC84lg3kS8K/vfDFX
         XGlKLqAwFOmMAyIs3BT6cBIzP+8b3nTaVzRYc2Ex+Gv5yhOW2vi+w53upGeqHAuTRKsh
         r6backpIeEZS2NBe8VSfc8Chm0Kzs9FaXaLupoq7LUsHqJmt5nKMgATfNDtgpVPhmv/1
         IWTS7TfC/zIotJjbCHtyCfLuDE4pqRA1kjUjPahZyan+xM8Ce6rhR3Fu/Xut9jHfzpdE
         JuRIUz42h0H42wriCHf6rSaIfMN46nJLl7FR8im0PGTjZgqPeLqxYEQVresr75wtwr7q
         Q/tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790415548; x=1791020348; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YnoEa8nIBlb12uQdVO70Zdurzs3LLhT9E/NYHqgSUgc=;
        b=Uoewx4haH0km89MUdgtrXcuMXbX3v7/jyA6PorrpO9w5NsJ3VK4qsPaz90zS/IEFN3
         zCkNm3ezcybKU7HKji+yaw7+3HQo8q6KOWKjP28qtZQPt+lx7lFPo6hhPBNJ0nMcK4NW
         XpzNXwFxBlWrw1mEnGwFiQ9VJv88OguJcRb0ENeGpY3+IGk5NPb8dlq8fKIWzvwYfAVk
         8G3G44VFMxEpNY2+1+LpoDgfQNQA9o4KvmlN5d+hmzkjDXTxxtdU/Sp9xoONt+x2z8IC
         j79wRsth8pBNbogAxIoVwcs59S2t7QaWVgvMzHWs4NRKMS1vdmHs2hFkJ9+EWwCkcgu1
         xUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790415548; x=1791020348;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnoEa8nIBlb12uQdVO70Zdurzs3LLhT9E/NYHqgSUgc=;
        b=s4meduBJX49+PrAHIjYyPd4PRzSXXZuHDZcB+8UVDQFY/K5nOxzmCgI7aGkN6hkDl0
         xwvOkullbWb3FicN2z9Tb9f1G8onbXoAgf2/EC2Ya0AkEPPIYaFxGK85XgcavG+Wlkp9
         hGnxzrImn7kcebvhDmSSICeRKT+2eCf+8Cdp/Fxr/8zjDZ54/IpwwA6ZybAl5eiNk3ZI
         7CBXYQBXXnI1F+rQD7IxBYmWwAqViG9S7d76fp4p7BDJsChisdnFVLq2EFE29et04UCA
         0m6QiyYHLK1/ebpn2Bs6WQDLV/fCsU/Uu22DF42J0fa6N2cj6CvqzM8ExRMa/spQIpCT
         T0KQ==
X-Gm-Message-State: AFuF++m6FDXqeu3gDVKO7FTA1TjMUAucnrTyH7F1aX1N0QixrGolNeRq
	TaTPwucfaQp1y2FVE27W/VA9+L5bzXQGuRPB3GcXyvQU/noGWj4Qa8RT7YLdHpomNts1qvDeseO
	8tGsdbXIaEKTQUgrXpSB+gFvHoY5p9rN713hY
X-Gm-Gg: AYBFou2Lx/wqMst/PSXQcYoe2EsBJ4YjQlfEE2MwGSoxL8TDo6R12V1AOKnQxj6JqqJ
	sG+uXm71tWqDxxtfTD8YVNtHR6tOYfwijiOojR/FFCQiS75yIZi/2kIM02oP3pB6fbh29nWPAzl
	GKTRhSvvTVv85gATDCRQG033L21tGNT/xgWtxQ90fLd/V/naWM+ACPWogy3/j6qr3V05kgGWw1C
	QsNRPSqJq2tFimBMXGL5nGHSPDQcvZgeLtmLFwtXAtscrgKFXOgc8aG/uQ2XZ0x0YShJRZalNtj
	XWmy/wpPoQAfvTJWfhDkaCe8I/lAeO5pBu1MTV5l53hv8BEvYh/EB59Ih6pXlBpG5BUEPnpp8A0
	hg3+Q9J+7pWtXDQ==
X-Received: by 2002:a05:6402:27d1:b0:6aa:734a:a090 with SMTP id
 4fb4d7f45d1cf-6aac90c118fmr6899495a12.39.1790415547590; Sat, 26 Sep 2026
 02:39:07 -0700 (PDT)
MIME-Version: 1.0
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Sat, 26 Sep 2026 15:08:55 +0530
X-Gm-Features: AclHuK_NupfuPMwFeFYePaUGl31LhiwbCgeA9cWzbCFXU1qwkCvrqB-HDGRgCpw
Message-ID: <CAK0z5OmA2vwJP3bM+cBjcTxNb_5zFpwAaY5ttdtVo9CLDUsYAQ@mail.gmail.com>
Subject: [PATCH] lib: sbi: pmu: Validate reserved bits in counter config match flags
To: opensbi@lists.infradead.org, security@rustsbi.com
Content-Type: multipart/mixed; boundary="000000000000b72342065c5f9a20"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_023910_289238_57164556 
X-CRM114-Status: GOOD (  15.08  )
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
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--000000000000b72342065c5f9a20
Content-Type: text/plain; charset="UTF-8"

Patch attached below.

--000000000000b72342065c5f9a20
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-lib-sbi-pmu-Validate-reserved-bits-in-counter-config.patch"
Content-Disposition: attachment; 
	filename="0001-lib-sbi-pmu-Validate-reserved-bits-in-counter-config.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mui76aa70>
X-Attachment-Id: f_mui76aa70

RnJvbSA3NjcxMDEzMjZmYmI2NGFiODgyZDcwYzBiNjEzZGJkNjdlMjRjODYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb2tzaCBQYW5pY2tlciA8bW9rc2hwYW5pY2tlci43QGdtYWls
LmNvbT4KRGF0ZTogRnJpLCAyNSBTZXAgMjAyNiAxNDowMDowNyArMDUzMApTdWJqZWN0OiBbUEFU
Q0hdIGxpYjogc2JpOiBwbXU6IFZhbGlkYXRlIHJlc2VydmVkIGJpdHMgaW4gY291bnRlciBjb25m
aWcgbWF0Y2gKIGZsYWdzCgpUaGUgc2JpX3BtdV9jdHJfY2ZnX21hdGNoKCkgZnVuY3Rpb24gKFNC
SV9FWFRfUE1VX0NPVU5URVJfQ0ZHX01BVENILApGSUQgIzIpIGRvZXMgbm90IHZhbGlkYXRlIHRo
ZSBmbGFncyBhcmd1bWVudCBhZ2FpbnN0IHJlc2VydmVkIGJpdHMuCgpQZXIgdGhlIFNCSSBzcGVj
aWZpY2F0aW9uIFBNVSBleHRlbnNpb24sIFRhYmxlIDggKFBNVSBDb3VudGVyIENvbmZpZwpNYXRj
aCBGbGFncykgZGVmaW5lcyBiaXRzIDAgdGhyb3VnaCA3IG9ubHksIGFuZCBUYWJsZSA5IChQTVUg
Q291bnRlcgpDb25maWcgTWF0Y2ggRXJyb3JzKSByZXF1aXJlcyBTQklfRVJSX0lOVkFMSURfUEFS
QU0gd2hlbiB0aGUgZmxhZ3MKcGFyYW1ldGVyIGhhcyBhIHJlc2VydmVkIGJpdCBzZXQuIEN1cnJl
bnRseSBhbnkgYml0IGZyb20gOCB0byA2MyBpcwpzaWxlbnRseSBhY2NlcHRlZCBhbmQgdGhlIGNh
bGwgc3VjY2VlZHMuCgpzYmlfcG11X2N0cl9zdGFydCgpIGFuZCBzYmlfcG11X2N0cl9zdG9wKCkg
YWxyZWFkeSBndWFyZCB0aGVpciBmbGFncwphcmd1bWVudHMgd2l0aCBTQklfUE1VX1NUQVJUX0ZM
QUdTX01BU0sgYW5kIFNCSV9QTVVfU1RPUF9GTEFHU19NQVNLCnJlc3BlY3RpdmVseS4gVGhpcyBh
ZGRzIHRoZSBlcXVpdmFsZW50IFNCSV9QTVVfQ0ZHX0ZMQUdTX1ZBTElEX01BU0sKZ3VhcmQgZm9y
IHNiaV9wbXVfY3RyX2NmZ19tYXRjaCgpLCBmb2xsb3dpbmcgdGhlIHNhbWUgcGF0dGVybi4KClRo
aXMgaXMgdW5yZWxhdGVkIHRvIENWRS0yMDI1LTYzOTEzLCB3aGljaCBjb25jZXJucyBjaWR4X21h
c2sgPT0gMAppbiB0aGUgc2FtZSBmdW5jdGlvbiBhbmQgd2FzIGZpeGVkIGJ5IGNvbW1pdCA2OWEw
ZjAyNCAoImxpYjogc2JpOgpwbXU6IFJldHVybiBTQklfRUlOVkFMIGlmIGNpZHhfbWFzayBpcyAw
IiksIGFscmVhZHkgcHJlc2VudCBpbiB0aGlzCnRyZWUuIFRoYXQgZml4IGRvZXMgbm90IHRvdWNo
IGZsYWdzIHZhbGlkYXRpb24uCgpWZXJpZmllZCB3aXRoIGFuIGlzb2xhdGVkIHRlc3QgaGFybmVz
cyBvbiBRRU1VIHZpcnQgKHBsYXRmb3JtL2dlbmVyaWMpOgpmbGFncyB3aXRoIGJpdCA4LCBiaXQg
MjAsIGFuZCBhbGwgcmVzZXJ2ZWQgYml0cyBzZXQgcHJldmlvdXNseQpyZXR1cm5lZCBTQklfU1VD
Q0VTUzsgYWZ0ZXIgdGhpcyBmaXggdGhleSBjb3JyZWN0bHkgcmV0dXJuClNCSV9FUlJfSU5WQUxJ
RF9QQVJBTSwgd2hpbGUgdmFsaWQgZmxhZyBjb21iaW5hdGlvbnMgKFNLSVBfTUFUQ0gsCkNMRUFS
X1ZBTFVFLCBBVVRPX1NUQVJULCBhbmQgdGhlIGluaGliaXQgZmxhZ3MpIGFyZSB1bmFmZmVjdGVk
LgoKU2lnbmVkLW9mZi1ieTogTW9rc2ggUGFuaWNrZXIgPG1va3NocGFuaWNrZXIuN0BnbWFpbC5j
b20+Ci0tLQogaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oIHwgOSArKysrKysrKy0K
IGxpYi9zYmkvc2JpX3BtdS5jICAgICAgICAgICAgICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaCBiL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZh
Y2UuaAppbmRleCBmZDRlNzdjYS4uYzA0ODVkNWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc2JpL3Ni
aV9lY2FsbF9pbnRlcmZhY2UuaAorKysgYi9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNl
LmgKQEAgLTMwMiw3ICszMDIsMTQgQEAgc3RydWN0IHNiaV9wbXVfZXZlbnRfaW5mbyB7CiAJCVNC
SV9QTVVfQ0ZHX0ZMQUdfU0VUX1NJTkggIHwgXAogCQlTQklfUE1VX0NGR19GTEFHX1NFVF9NSU5I
ICAgIFwKIAkpCi0KKy8qIENvbmZpZyBtYXRjaCBmbGFncyB2YWxpZCBtYXNrICovCisjZGVmaW5l
IFNCSV9QTVVfQ0ZHX0ZMQUdTX1ZBTElEX01BU0sgICAgXAorCSggXAorCQlTQklfUE1VX0NGR19G
TEFHX1NLSVBfTUFUQ0ggIHwgXAorCQlTQklfUE1VX0NGR19GTEFHX0NMRUFSX1ZBTFVFIHwgXAor
CQlTQklfUE1VX0NGR19GTEFHX0FVVE9fU1RBUlQgIHwgXAorCQlTQklfUE1VX0NGR19FVkVOVF9N
QVNLICAgICAgICAgXAorCSkKIC8qIEZsYWdzIGRlZmluZWQgZm9yIGNvdW50ZXIgc3RhcnQgZnVu
Y3Rpb24gKi8KICNkZWZpbmUgU0JJX1BNVV9TVEFSVF9GTEFHX1NFVF9JTklUX1ZBTFVFICgxIDw8
IDApCiAjZGVmaW5lIFNCSV9QTVVfU1RBUlRfRkxBR19JTklUX0ZST01fU05BUFNIT1QgKDEgPDwg
MSkKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKaW5k
ZXggZTc5ZjZiNjAuLmIyYzE0YzEyIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9wbXUuYworKysg
Yi9saWIvc2JpL3NiaV9wbXUuYwpAQCAtOTI0LDYgKzkyNCw4IEBAIGludCBzYmlfcG11X2N0cl9j
ZmdfbWF0Y2godW5zaWduZWQgbG9uZyBjaWR4X2Jhc2UsIHVuc2lnbmVkIGxvbmcgY2lkeF9tYXNr
LAogCWV2ZW50X3R5cGUgPSBwbXVfZXZlbnRfdmFsaWRhdGUocGhzLCBldmVudF9pZHgsIGV2ZW50
X2RhdGEpOwogCWlmIChldmVudF90eXBlIDwgMCkKIAkJcmV0dXJuIFNCSV9FSU5WQUw7CisJaWYg
KGZsYWdzICYgflNCSV9QTVVfQ0ZHX0ZMQUdTX1ZBTElEX01BU0spCisJCXJldHVybiBTQklfRVJS
X0lOVkFMSURfUEFSQU07CiAJZXZlbnRfY29kZSA9IGdldF9jaWR4X2NvZGUoZXZlbnRfaWR4KTsK
IAogCWlmIChmbGFncyAmIFNCSV9QTVVfQ0ZHX0ZMQUdfU0tJUF9NQVRDSCkgewotLSAKMi4zNC4x
Cgo=
--000000000000b72342065c5f9a20
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--000000000000b72342065c5f9a20--

