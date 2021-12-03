From: Vagrant Cascadian <vagrant@reproducible-builds.org>
Date: Fri, 03 Dec 2021 12:43:30 -0800
Subject: [PATCH v2] Makefile: Pass relative paths to the compiler.
In-Reply-To: <CAAhSdy3LDXp0RfXKwKOPR1uFqbwq6P1HLq7AcVs-FwATPyX-ug@mail.gmail.com>
References: <20211129015502.4767-1-vagrant@reproducible-builds.org>
 <CAAhSdy3LDXp0RfXKwKOPR1uFqbwq6P1HLq7AcVs-FwATPyX-ug@mail.gmail.com>
Message-ID: <87r1atifm5.fsf@yucca>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-12-02, Anup Patel wrote:
> On Mon, Nov 29, 2021 at 7:25 AM Vagrant Cascadian
> <vagrant@reproducible-builds.org> wrote:
>>
>> Upstream commit 12753d22563f7d2d01f2c6644c7b66b06eb5c90f introduced
>> uses of __FILE__ which may result in the build path getting embedded
>> into the resulting binary.
>>
>> https://reproducible-builds.org/docs/build-path/
>>
>> Signed-off-by: Vagrant Cascadian <vagrant@reproducible-builds.org>
>> Cc: Xiang W <wxjstz@126.com>
>> Cc: Anup Patel <anup@brainfault.org>
>
> Now that we have sbi_panic() and SBI_ASSERT() in-place (Jessica's patch), we
> don't need to change the top-level Makefile because __FILE__ is not
> used anywhere
> in sources.

I can confirm that fixes the issue of embedded build paths.


> Going forward, we should avoid taking patches that use __FILE__ so that we don't
> break reproducible builds.

Thanks for keeping reproducible builds in mind!


live well,
  vagrant
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 227 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20211203/d1985595/attachment.sig>
