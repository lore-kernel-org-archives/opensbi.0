Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77666606A31C
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ILiSFdBQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5FPK90L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxS+dCcV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IRgGSTvtrGY1yDDVzDdvbXMVdyZPvtFGTdCoveh8+uE=; b=ILiSFdBQ2CX2r76r3nIQBI2Xuz
	sQD8GOoNpGsthPcjWB8TEhfaYNylDtjmIJMN4iZn3mBdtic8T3Kq8DgOZPoF6v+DyLlxcZI8Bgtd/
	8HpL7h5qwoGAS8Xy93z0WiEXpgASdRgWSsbp8EMrcnd9cPj1pDt0thn1LifnFnm4zFxIU+1V66Cip
	aReO7WSsmeojS/BAkn+bEVWlj/D9MobM1vwUwrV8pvdYQD/nw76EhoxdbdI8zxAnLzRbuqsBVUKs2
	ln45vAj12YwiWZ+xpYPLJD/72rTqGqpQLRJOotkbctrSYQj3QbrypopYRFj8hsKANpcap9R17D9GF
	Eneg0DXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMyQ-00000006Z06-1sGE;
	Tue, 17 Nov 2026 17:28:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMyN-00000006Yzc-2vN0
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQbxE4169868
	for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 17:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIuFGJ5UXg9vskP893VXXKdDxREbkuZ7rxdjEWlqeQM=; b=T5FPK90LsWrtRQ37
	sehNf3bd0wn7lYpbX0Cq1UlPMUG0iDZedkd+d/JgpPK/oZyvwt5wRxLDSmlXN4vk
	LaK1d7D+oQuO38lHJLK6BYs2LvUGyMu6MF4xu1mlGALScbbFYhpUYWZNy8mYkkgk
	cfqIp2rjslrvvO+zriHf8eVhxehlzQ99WG6mu7qvP0lqvJ1PWoJ/xlL8m2BzNaVc
	LYLjlwpW6rcRv09H2UYGvbldrm7CqMMOkGXTY3IrRF9ZZiA0jKP93GdeibgXsTaT
	bA/3mveo7V/2ziey9VxZX5+jyBhQIoGSEsOF4dGfTbvj0V9O5AX8i1WXzuhf/uaO
	MBhs5w==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve2qns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 17:27:59 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-71acf48ae14so57201eaf.0
        for <opensbi@lists.infradead.org>; Tue, 17 Nov 2026 09:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936478; cv=none;
        d=google.com; s=arc-20260327;
        b=jXlLqpARzXkD0BMN0sv8m6GlewMLq+DpBlS3UDoWVweifX7t6EmTJwA5QmugO91O9m
         bvl2LdPjWngrBgPoOXsSVQA1JdjLL5LF++7xtN6ObGu2nJ9sE718Cs8e7yXyNWYEXQkG
         Y4E33IZ0eUWDlQ/fCm7pocFG0vUlCmiRhxb0QgIknr2uuGT2wv4/CrJ4PAc8FF+xtgpl
         MpMs72BSAEDWAsoqoXL+XBt8I6Kewyo3PeAVUb5mclHFrtwVtJA09lsyZUc0mkAecdxx
         OfdXijkfD83MvuNYmvo/C128fk6fsgq5pmEQ3Jm3EEw8eq+eF0i5GxpbXigMhgLhOuN7
         JoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIuFGJ5UXg9vskP893VXXKdDxREbkuZ7rxdjEWlqeQM=;
        fh=+eoEyy2KpUXI1lAUJtAPM56xWRepPrSoMxSngBtsTiA=;
        b=jRhOhcteh6vv5+e0ZuGCQPSE2Q3X1iEqA1SnoMiMf4VajyIRBHH5RLAjI7yDLLsnAI
         66jpcNCLnnZqODWGVkXlAnFHyG2MivIdFgUTKV1hL48Bpp7VIBpbsapFdLoihgOVdGgX
         5GDlt9cFVhTijeoXKRgrx6itCaK4A7/t8Wgomup5dt7Z8jwb7q/6Tow4qoeB+PbQDnhp
         MHBXxpwlg6JBV9mSIU4t1mlZU7vGaylwRoDw8h/bKqthZyPjMdZCeeL3KpbW0IEcX207
         YqjLI4fmHY2frd03oX/8Pou85544rUMAbiE9uBLreENS9vRa+/Ag7J0mo5F1XXczOjyg
         UBTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794936478; x=1795541278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuFGJ5UXg9vskP893VXXKdDxREbkuZ7rxdjEWlqeQM=;
        b=SxS+dCcVWk7kI7BVIBo/hQonXD6jiGMllS4fbOdjZZMhnL1RybKp6ZFW7MpAW5KxUg
         X5EOEnzT6fSU8u1h16Z0ZkUA/Bd69PIX6fDb35jxdY/dk297Vdnh1jFDF0SlHwoc5bdg
         cHoMtVnw2h+VVToAvAGuxp98PZMYIFy0blwCLf+zKA1sg9wwWz/WgPs+t9tXyoBcHFge
         chCt/bV55+4u+pkY7/HiKi9xY8KVH4yKk4tYmMl/epxjl39OBr9772JX6t3P5pmVUMnP
         A6+V2J2yp9HDGDPjNX5fdeHt7ZWWoi9d1HlEcHjVFk1zIdTQUID9UWrM1uAD1tOvRBN0
         pBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936478; x=1795541278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuFGJ5UXg9vskP893VXXKdDxREbkuZ7rxdjEWlqeQM=;
        b=U0AmmWXRChb/EtDNBwjO+7j5yHJe2ATQZnxe8+E5IUYlSJsBSO/PC4Ii5/T1o9Jdun
         RhDLj3MktQYd77hTU87UT35eiYkhbvS9wk37BBzXFlNrO+WUV2hgd6/0wz7Q2lRMk2o1
         zojw7Rm3Y0ufDehv2jcgmgoCII3bo+xhSCwsrMEwy3gZBJUrgMsVQF7L30JzQGj56Ozt
         stfAnoYa6/Rt07rvRzrfVeiY+mMpHyxurT1S6tx8BbSEfv/mCW+HYpICnejMqBZ7Ue7X
         jASPZ+L9AK2cQ+Qrje5l2oqVSYzftBVgu/Cw/O6CgiI9wi+w4A7Cw5yIIfI7mlsFBetR
         BUUw==
X-Gm-Message-State: APuU4Z9nu7cBUcbkiXXv/uBpItrw+er8dBlwmFpmOV8vNv1TZQMxB75y
	dVDC+3ER7zkdIiGOVjz/LzgeIK7e+vizY6HA1EeDQtD8VQTeAD5STtPMV1Pv4KMnVvFjkizBlIX
	zSKjg4zd2Ow3G23ETaON2LQpY82dxHeZwNt1Hn6y+6OkcU6B1q/ivRc5uvrOa8Cy2Y1uZx3Nrsc
	+6fLGQ6uwMP1BSmyUDZZlFQmvDW4CSLgFiixqMGKvTcBwIlN+F
X-Gm-Gg: AYBFou1LfPjPfwBLh7cRL6Nan+gQVdgN8uLLLgNIKuHF4ghS/jr7Ikvec1ud2a7bndA
	WfAWqiMMvAvs7ojLrird568ZvW9nFe4W6ET19QZp/LH8VRPIQ/YE0kdXeZ9EnbX8ohkRjCly4uV
	9+RjykKJJ1+tbz+ZKfCXz20iX8Ls527jECgttq3wnGCGYrOG8Q1T1wzm6UVQ==
X-Received: by 2002:a05:6820:1c87:b0:6cd:3fdc:5ff6 with SMTP id 006d021491bc7-71acc2e636dmr8313129eaf.71.1794936478250;
        Tue, 17 Nov 2026 09:27:58 -0800 (PST)
X-Received: by 2002:a05:6820:1c87:b0:6cd:3fdc:5ff6 with SMTP id
 006d021491bc7-71acc2e636dmr8313104eaf.71.1794936477725; Tue, 17 Nov 2026
 09:27:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com>
 <20261116214722.243038-3-pawandeep.oza@oss.qualcomm.com> <CAFR3w34uzDtcg9rz2r7O97MK9gjLJiHMPtPwFekNrqTH+UWfyQ@mail.gmail.com>
In-Reply-To: <CAFR3w34uzDtcg9rz2r7O97MK9gjLJiHMPtPwFekNrqTH+UWfyQ@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 09:27:44 -0800
X-Gm-Features: AclHuK9cNliDd0wTifbT8BL8QSFgX5-DlWR-jC26jq7pYLeo8JFWa5zYqGPZgPA
Message-ID: <CAAVgOkJW-HkujOWyz6jX-Og4MXcoOtzZq6oR=k=h=PDBYzZKqg@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] include: sbi/sbi_hartmask: add equality helper
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX9kpl3G32E6Io
 PvIRP/IEbzJrPesCQHaQh3T/k51sqi6rr/TFT8jmxJSPb13YN6VdxLCwhAUsgGnJMcf/7sLe+Y0
 95bM6RwT3dtlzD8gLhEYFIbKQtrc5mA=
X-Proofpoint-GUID: Jetd2bV3yNG5oQvXwyZFhmezUKsUjlGo
X-Proofpoint-ORIG-GUID: Jetd2bV3yNG5oQvXwyZFhmezUKsUjlGo
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc8e9f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=KuXDv3vRv_Qla7xYikMA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfXzaVNw7ZKEC7f
 C4LSMmEqHiQ6cfl9+y5N7TrZoZMDqkWEMDQRfyapGmQ06mjHxk2KEBh4mVx1QWgFOItcsjgtY5f
 e1b+4KM8vjef83e98WQtWptXs45ng2cICY0k8EmGDcsDuVLVz1gCfgMJwRFZy9YL6snXRV5ifHH
 b8eC8eeKzjLNjYGxHzgZLWp5NMsu6xnoc3+Qx0+v1ntUZEuzDZCeZ3+cA9ZguZHdxifcVC3afRy
 iR1XDll/Zy20IQ22Cl2aqQacoxWlaNyPh24MOadCmU7ko6xeZtl4ekDGyko52wGndB31zPQMFXA
 C6xceia0VdVMzSeAcqmKQSy8tHUJi/pmB3j3ZcAHC3JhDM20aZ2Uv1vi7BqngxKu8wkk7Kee2qn
 8hFw8lopIUZ3O8VEE9IiN/sz8uYwKJtGgFxE/BL9WpHbOlXmvn9SEYXfUuqrrA6WB+7vfoYfRO2
 7zkDpu2CGzfYGJwgLIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092759_752555_96EA8910 
X-CRM114-Status: GOOD (  21.70  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMTYsIDIwMjYgYXQgNzowN+KAr1BNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMTcsIDIwMjYgYXQg
NDowNuKAr0FNIFBhd2FuZGVlcCBPemEKPiA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5x
dWFsY29tbS5jb20+Cj4gPgo+ID4gQWRkIHNiaV9oYXJ0bWFza19lcXVhbCgpIHRvIGNoZWNrIHdo
ZXRoZXIgdHdvIGhhcnRtYXNrcyBjb250YWluIHRoZQo+ID4gc2FtZSBoYXJ0IGluZGV4ZXMuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVh
bGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggfCAyNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oIGIv
aW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiA+IGluZGV4IGRhNjgyMWVlLi4yNTNhNWRjZCAx
MDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gPiArKysgYi9pbmNs
dWRlL3NiaS9zYmlfaGFydG1hc2suaAo+ID4gQEAgLTIwNiw0ICsyMDYsMzAgQEAgc3RhdGljIGlu
bGluZSBpbnQgc2JpX2hhcnRtYXNrX3dlaWdodChjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRtYXNrICpz
cmNwKQo+ID4gICAgICAgICAgICAgICAgIChfX2kpIDwgU0JJX0hBUlRNQVNLX01BWF9CSVRTOyBc
Cj4gPiAgICAgICAgICAgICAgICAgKF9faSkgPSBmaW5kX25leHRfYml0KChfX20pLT5iaXRzLCBT
QklfSEFSVE1BU0tfTUFYX0JJVFMsIChfX2kpICsgMSkpCj4gPgo+ID4gKwo+ID4gKy8qKgo+ID4g
KyAqIENoZWNrIHdoZXRoZXIgdHdvIGhhcnRtYXNrcyBhcmUgZXF1YWwKPiA+ICsgKiBAcGFyYW0g
YSB0aGUgZmlyc3QgaGFydG1hc2sgdG8gY29tcGFyZQo+ID4gKyAqIEBwYXJhbSBiIHRoZSBzZWNv
bmQgaGFydG1hc2sgdG8gY29tcGFyZQo+ID4gKyAqCj4gPiArICogUmV0dXJuOiB0cnVlIGlmIGJv
dGggaGFydG1hc2tzIGNvbnRhaW4gdGhlIHNhbWUgaGFydHMsIGZhbHNlIG90aGVyd2lzZQo+ID4g
KyAqLwo+Cj4gRm9yIHRoaXMgc2ltcGxlIGNvbXBhcmlzb24gd2h5IG5vdCBwZXJmb3JtIHRoZSB3
b3JkcyBjb21wYXJpc29uCj4gaW5zdGVhZCBvZiBnb2luZyBiaXQgYnkgYml0LiBCSVRTX1RPX0xP
TkdTIHdpbGwgZ2l2ZSB0aGUgZml4ZWQgd29yZHMKPiBtYWtpbmcgdGhlIHNiaV9oYXJ0bWFzay4K
b3phOiBzb3VuZHMgZ29vZCwgc3VyZSBsZXQgbWUgY2hhbmdlIHRoaXMgd2F5Lgo+Cj4gPiArc3Rh
dGljIGlubGluZSBib29sIHNiaV9oYXJ0bWFza19lcXVhbChjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRt
YXNrICphLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3Qgc2JpX2hhcnRtYXNrICpiKQo+ID4gK3sKPiA+ICsgICAgICAgdTMyIGhhcnRpbmRleDsK
PiA+ICsKPiA+ICsgICAgICAgc2JpX2hhcnRtYXNrX2Zvcl9lYWNoX2hhcnRpbmRleChoYXJ0aW5k
ZXgsIGEpIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hhcnRp
bmRleChoYXJ0aW5kZXgsIGIpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIHNiaV9oYXJ0bWFza19mb3JfZWFj
aF9oYXJ0aW5kZXgoaGFydGluZGV4LCBiKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFzYmlf
aGFydG1hc2tfdGVzdF9oYXJ0aW5kZXgoaGFydGluZGV4LCBhKSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBy
ZXR1cm4gdHJ1ZTsKPiA+ICt9Cj4gPiArCj4gPiAgI2VuZGlmCj4gPiAtLQo+ID4gMi40My4wCj4g
Pgo+ID4KPiA+IC0tCj4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4gb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
