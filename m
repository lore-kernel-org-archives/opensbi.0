Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6842BCAC592
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rr/NZ67A+1Z4jRujPXN3D/ePT0tzhsza4z65QC6nKAs=; b=esDzgotdw2a7BW
	mFrNFfqax5qkhgEQAIk4KJF8+eew5+ojisC0yJo5jkPEm1v3XJKtOwGVsV97f3J8QyVkqzGIsxhyE
	3ilngWHS8KQu3RL2Emm47AkNmh12/FnrgSoU1abY6v5+gCGjiZnQp1ksjXAtqEQn9dBcsw60m69np
	T/Pc1o2h6GoSudaI80wQ2oSlHQKSUh3TcW3994sDjZOz+5lLibabBQuD29572+h3sy9vju+r+/scP
	SDAANgmCUdwu9p2cNmO92gNp8Mb6J3Qm/SibgzyRagaTeFLTg52rnsjBC7hAJGZFE8FyTOw1LvVp/
	g/t2w/t8ZSvZD6121KqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aDu-000000090R3-2HiN;
	Mon, 22 Sep 2025 06:40:30 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aDr-000000090Pd-0OXR
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758523198;
	bh=Kac/j+bcRkppZijshrhfo1pe7XaH2/WIBcFPkBKzu38=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=GujTvC6KZVIu4gYR9eYNZ9I90CWNXa/lPWRtraXcStZTENhu5NAVTWFnzHRU+ZAUr
	 /plwjM3+/kUcaQvuF77rUjhhWwhIVDERw+CX2zIMY95A4Xs+pp1XF+U+FCZMXzbi/F
	 2bFMsI6wmOy5KnkPoXVrmSHizNQia2dq4abTYIfg=
X-QQ-mid: zesmtpgz5t1758523194t3ac69ab9
X-QQ-Originating-IP: +L4F01ndsMPm1zP7Hmdb00jHxB230SHaC542RaTNoiY=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 14:39:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17020568093644811683
EX-QQ-RecipientCnt: 4
Date: Mon, 22 Sep 2025 14:39:53 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Anup Patel <anup@brainfault.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
Message-ID: <D2E0AC74806ED212+aNDvOZf97NmqlQ32@LT-Guozexi>
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi>
 <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
 <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi>
 <CAAhSdy2E+ZCrJUmB_Tm1qBC6gY6JOgwQKOXpVbcHOiZe9zJUHg@mail.gmail.com>
 <84B498E97DCDF5D1+aNDsXkDCXMlENDMt@LT-Guozexi>
 <CAAhSdy1LM5OOhSxPqxx3eRjNqs82eJfzYSOnXTiz0s3hLEn-Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1LM5OOhSxPqxx3eRjNqs82eJfzYSOnXTiz0s3hLEn-Wg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MECmdajjeAEDktrmyb09KFbXaWmdVNs/FcfHGo+IMr4lwh5+AjZ6feJU
	/seDxWERYZR1Iew6O8Qqy84mXHz/7VFep2pnvNCFERIh/oLBtdNt7JX8U5QqUtKkPYBijg3
	Oqa0f0wRjgK45bdB+jcOz8B2LtHpZDAPyYtFPttlx/Bx3yC6FPOp0+j5zWoDwDI9GsWRRhj
	zSABIbZ51zQuZujezc6CZ6Js3c9UYioK3a3dHielalmchadztrW9JFwGh9BndVEFC+JerEm
	9GJcF2Y/+SaoeKOBcQnJtuDf0yrdfF1jEmoWbRq7sI+R+BvuxfX2kZcOGx41tE7PhJxVcHE
	6rbCQTY1VLQocFyUciNqpshdryBUOhDd/jpVozEFrrLAcwrMq52bKp+y5yQE09fppWGZ0Cc
	5SQT6j1/yhrVE8TKpY6Gl4JtokOOfoiYNbLiWY+2j53RvhYn8yT/sBpUZUfkAPy7GJq5+Hi
	MEevygR8XDDKdtQcp7Iv7awpHfz6evQMf/8EvJLuhCXEpVWTzt+qgxNp/Jolt5LJBVY3rZs
	fn7+GWy6iDXbqc/0BLPyYNDW4Ea1JbjCDPRRDb9WWQBqHZavE0uIL9A3dOUTmcYifUZGwbi
	YyKw1dSnaaD368JxkP3dhP2c54jC23wIBszU1ha4vaH3uvEYOXZ975YpwT7jL49rZyIcMSq
	11BPRRaiXVHN++gj2Ln3rdu3hM/7+jJfw1H6JURKHbPvP4JN5ftsDFsk4IYIrN0HdLDMQPo
	FS/p9EeCHim0DQA77ADLjaG1VApeompIvdZXZm7FoUgJFHd7dIft6/+tJbny+7AAj1vRJkY
	SZkB3ox7/tU4qNCcp9O1Okeu1L8nBgt0YDS0yt6700OwEspcIr5Xf47bMp36kxRljfrKGtW
	LsF/0psw2YC9jOG+oJbwriHdEcpZGlYl9EjFgZPmvcsRqnzuACU1O2VmL3gqE0tI2BSjpKJ
	LISLABeFi1yqVi41fBbB53/jxaVsq4LEF1T2EXYyBaFgSUj0ne1YWf/g3Mu9DTG8cs6VvEB
	V4RmoaRhSSjy4lm/ELWZbspFN0NyMkttR4E9doOT6e2QVhVkKEiXIcChsxaPA4c21fszMtt
	nBMWdzBL5zxUc5uvfvcHJI2fwQZSIn6cg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_234028_117637_8C5AB657 
X-CRM114-Status: GOOD (  33.28  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTI6MDc6NDBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBNb24sIFNlcCAyMiwgMjAyNSBhdCAxMTo1N+KAr0FNIFRyb3kgTWl0Y2hlbGwKPiA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
U2VwIDIyLCAyMDI1IGF0IDExOjQ5OjM4QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+
IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDExOjM54oCvQU0gVHJveSBNaXRjaGVsbAo+ID4gPiA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6MzE6MzVBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiA+ID4gPiA+IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDExOjEy4oCvQU0gVHJveSBNaXRj
aGVsbAo+ID4gPiA+ID4gPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMDg6NTU6MjVB
TSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBNb24sIFNlcCAyMiwg
MjAyNSBhdCA2OjQ24oCvQU0gVHJveSBNaXRjaGVsbAo+ID4gPiA+ID4gPiA+IDx0cm95Lm1pdGNo
ZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ID4gRnJvbTogWGlhbmJpbiBaaHUgPHhpYW5iaW4uemh1QGxpbnV4LnNwYWNlbWl0LmNvbT4K
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBFeHRlbmQgZ2VuZXJpYyBwbGF0Zm9ybSB0
byBzdXBwb3J0IFNwYWNlbWlUIEsxLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9u
IEsxLCB0aGUgQlJPTSBvbmx5IGJyaW5ncyB1cCB0aGUgcHJpbWFyeSBjb3JlIGFuZCBsZWF2ZXMg
dGhlCj4gPiA+ID4gPiA+ID4gPiBvdGhlciBjb3JlcyBpbiBhIGRpc2FibGVkIHN0YXRlLiBUaGlz
IHByZXZlbnRzIExpbnV4IGZyb20gYm9vdGluZwo+ID4gPiA+ID4gPiA+ID4gU01QIGFuZCBvbmx5
IG9uZSBjb3JlIGlzIGF2YWlsYWJsZS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBB
ZGQgY29kZSB0byBicmluZyB1cCBhbGwgOCBjb3JlcyBkdXJpbmcgT3BlblNCSSBpbml0aWFsaXph
dGlvbiBzbwo+ID4gPiA+ID4gPiA+ID4gdGhhdCB0aGUgTGludXgga2VybmVsIGNhbiBkZXRlY3Qg
YW5kIHVzZSBhbGwgY29yZXMgcHJvcGVybHkuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gQ28tYXV0aG9yZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3Bh
Y2VtaXQuY29tPgo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGludXguc3BhY2VtaXQuY29tPgo+ID4g
PiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+ID4g
PiA+ID4gLSByZW1vdmUgX19zYmlfaHNtX2hhcnRfZ2V0X3N0YXRlKCkgaW4gc3BhY2VtaXRfY29s
ZF9ib290X2FsbG93ZWQoKQo+ID4gPiA+ID4gPiA+ID4gLSBwbHVzIFBNVV9BUF9CQVNFIGluIFBN
VV9BUF9DT1JFKDB8NClfKFdBS0VVUHxJRExFKV9PRkZTRVQKPiA+ID4gPiA+ID4gPiA+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkxNi1zbXQtazEtOC1jb3Jl
cy12MS0xLTViNzZlMDZkMTJkYUBsaW51eC5zcGFjZW1pdC5jb20KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IEl0IGlzIGJldHRlciB0byBoYXZlIGEgc2VwYXJhdGUgZmR0X2hzbV9zcGFjZW1p
dCBkcml2ZXIgdW5kZXIKPiA+ID4gPiA+ID4gPiBsaWIvdXRpbHMvaHNtIGRpcmVjdG9yeS4KPiA+
ID4gPiA+ID4gV2UgYXJlIG5vdCBnb2luZyB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4KPiA+ID4g
PiA+ID4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kLgo+ID4gPiA+ID4gVGhpcyBwYXRoIGFscmVhZHkg
cmVnaXN0ZXJzIHNiaV9oc21fZGV2aWNlIHNvIGFsbAo+ID4gPiA+ID4gSSBhbSBhc2tpbmcgaXMg
dG8gY3JlYXRlIGEgcHJvcGVyIEhTTSBkcml2ZXIgdW5kZXIKPiA+ID4gPiA+IGxpYi91dGlscy9o
c20gZGlyZWN0b3J5Lgo+ID4gPiA+IFBlcmhhcHMgSSBtaXN1bmRlcnN0b29kIHNvbWV0aGluZy4g
V2hhdCBJIG1lYW50IGlzIHRoYXQKPiA+ID4gPiB3ZSBkbyBub3QgcGxhbiB0byBzdXBwb3J0IHJw
bWkuCj4gPiA+Cj4gPiA+IFRoZSBsaWIvdXRpbHMvaHNtIGlzIG5vdCBvbmx5IGZvciBSUE1JIEhT
TSBkcml2ZXIuIFBsYXRmb3Jtcwo+ID4gPiBjYW4gYWRkIHRoZWlyIEhTTSBkcml2ZXIgdW5kZXIg
dGhpcyBkaXJlY3RvcnkgYXMgd2VsbC4KPiA+ID4KPiA+ID4gPiBBbHNvLCBJIG5vdGljZWQgb3Ro
ZXIgcGxhdGZvcm1zIGFyZSBkaXJlY3RseSByZWdpc3RlcmluZyB2aWEKPiA+ID4gPiBzYmlfaHNt
X3NldF9kZXZpY2UoKSBpbiB0aGVpciBwbGF0Zm9ybSBjb2RlOgo+ID4gPiA+Cj4gPiA+ID4gYGBg
Cj4gPiA+ID4gYWxsd2lubmVyL3N1bjIwaS1kMS5jOjE5MDogICAgICBzYmlfaHNtX3NldF9kZXZp
Y2UoJnN1bjIwaV9kMV9wcHUpOwo+ID4gPiA+IGFuZGVzL2FlMzUwLmM6MTAxOiAgICAgICAgICAg
ICAgc2JpX2hzbV9zZXRfZGV2aWNlKCZhbmRlc19zbXUpOwo+ID4gPiA+IG1pcHMvcDg3MDAuYzoy
MTk6ICAgICAgICAgICAgICAgc2JpX2hzbV9zZXRfZGV2aWNlKCZtaXBzX2hzbSk7Cj4gPiA+ID4g
YGBgCj4gPiA+Cj4gPiA+IEZldyBvZiB0aGVzZSBwbGF0Zm9ybXMgd2VyZSBhZGRlZCBiZWZvcmUg
YSBkZWRpY2F0ZWQKPiA+ID4gbGliL3V0aWxzL2hzbSBkaXJlY3Rvcnkgd2FzIGNyZWF0ZWQgZm9y
IEhTTSBkcml2ZXJzLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQ291bGQgeW91IHBsZWFzZSBwcm92
aWRlIG1lIHdpdGggbW9yZSBpbmZvcm1hdGlvbj8KPiA+ID4KPiA+ID4gR3JhZHVhbGx5LCB3ZSBu
ZWVkIHRvIG1vdmUgSFNNIGRyaXZlcnMgZnJvbSBwbGF0Zm9ybS9nZW5lcmljIHRvCj4gPiA+IGxp
Yi91dGlscy9oc20gYXMgaW5kZXBlbmRlbnQgSFNNIGRyaXZlcnMKPiA+ID4KPiA+ID4gSSBoYXZl
IGFscmVhZHkgc3VnZ2VzdGVkIHRoaXMgZm9yIFNpRml2ZSBUTUMwIGFuZCBTTUMwIGRyaXZlcnMK
PiA+ID4gYXMgd2VsbC4KPiA+ID4gKFJlZmVyICJbUEFUQ0ggdjYgMDAvMTFdIEFkZCBTaUZpdmUg
VE1DMCBhbmQgU01DMCBkcml2ZXIiKQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIEFudXAh
Cj4gPiBJdCdzIGNsZWFuIG5vdy4gSSdsbCBzZXBhcmF0ZSB0aGlzIHBhdGNoLgo+IAo+IE9uZSBt
b3JlIHN1Z2dlc3Rpb24gaXMgdGhhdCB5b3UgY2FuIHNpbXBseSByZS11c2UKPiAic3BhY2VtaXQs
azEiIGFzIHRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgeW91ciBIU00KPiBkcml2ZXIuCj4gCj4g
SW4gdGhlIGZ1dHVyZSwgeW91IGNhbiBwcm92aWRlIEhTTSBzdXBwb3J0IGZvciBtdWx0aXBsZQo+
IHNwYWNlbWl0IFNvQ3MgZnJvbSB0aGUgc2FtZSBIU00gZHJpdmVyIChhc3N1bWluZwo+IHRoZXkg
d2lsbCBiZSBzaW1pbGFyIHdpdGggaW5jcmVtZW50YWwgY2hhbmdlcykgYW5kCj4gTU1JTyBiYXNl
IGFkZHJlc3Mgb2YgcmVnaXN0ZXJzIGNhbiBiZSBpbmZlcnJlZCBmcm9tCj4gY29tcGF0aWJsZSBz
dHJpbmcuClRoYXQncyB2ZXJ5IHVzZWZ1bCBzdWdlc3Rpb24uCkknbGwgdGFrZSBpdC4KClRoYW5r
cyBhZ2Fpbi4gSGF2ZSBhIG5pY2UgZGF5IDopCgogICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4g
UmVnYXJkcywKPiBBbnVwCj4gCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
