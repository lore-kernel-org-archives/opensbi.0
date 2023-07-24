From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 24 Jul 2023 05:54:32 +0100
Subject: v1.3.1 tag is not present in any branch
In-Reply-To: <CAAhSdy0+RqENaaBFbzt=fVUNF5APvJCKQYF8Wb2U+AYCfkjiAA@mail.gmail.com>
References: <87h6pxz1dj.fsf@wireframe>
 <CAAhSdy3Xjt-616YS93XsvM0PA3v2LgM99Ur0r_e9xopE=bhVEA@mail.gmail.com>
 <CDB4B450-4B9C-4406-A56B-77BA869FF060@jrtc27.com>
 <CAAhSdy0+RqENaaBFbzt=fVUNF5APvJCKQYF8Wb2U+AYCfkjiAA@mail.gmail.com>
Message-ID: <C68B62D3-6807-4094-AC9F-E1B3C67F6B4C@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24 Jul 2023, at 05:41, Anup Patel <anup@brainfault.org> wrote:
> 
> On Mon, Jul 24, 2023 at 9:24?AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>> 
>> On 24 Jul 2023, at 04:47, Anup Patel <anup@brainfault.org> wrote:
>>> 
>>> On Sat, Jul 22, 2023 at 6:38?AM Vagrant Cascadian <vagrant@debian.org> wrote:
>>>> 
>>>> As seen on IRC and github issues:
>>>> 
>>>> https://github.com/riscv-software-src/opensbi/issues/316
>>>> 
>>>> There does not appear to be a branch that contains v1.3.1, which makes
>>>> it rather complicated to actually fetch the tag.
>>>> 
>>>> https://github.com/riscv-software-src/opensbi/tree/v1.3.1
>>>> 
>>>> This commit does not belong to any branch on this repository, and may belong to a fork outside of the repository.
>>>> 
>>>> Please push a 1.3.x branch or some such with the tag!
>>> 
>>> I had pushed release-1.3.1 branch two days back since few
>>> folks (including yourself) reported this issue.
>> 
>> What happens if there?s then a 1.3.2?
> 
> If the commit history of 1.3.2 differs from the master branch then
> we will have to create release-1.3.2 branch for 1.3.2 as well.

If 1.3.2 is based off master not 1.3.1 then that?s some very misleading
versioning. I would seriously hope that 1.3.2 is 1.3.1 + patches, both
content-wise and history-wise, and thus it belongs in a 1.3.x branch.

>> 1.3.1 is overly narrow. Good for tags but not branches.
>> Something like 1.3.x as suggested is more forward-thinking.
> 
> I agree and that's why I had only created a tag but it seems
> not everyone prefers git fetch to get latest tags.

So why did you choose to create release-1.3.1 rather than release-1.3.x
as was originally suggested?

Jess

> Regards,
> Anup
> 
>> 
>> Jess
>> 
>>> This is the first time that we did an intermediate release so
>>> going forward I will ensure that a separate branch in pushed
>>> for an intermediate releases whenever intermediate release
>>> has a different commit history compared to master branch.
>>> 
>>> Thanks,
>>> Anup
>>> 
>>> 
>>>> 
>>>> live well,
>>>> vagrant
>>>> --
>>>> opensbi mailing list
>>>> opensbi at lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>>> 
>>> --
>>> opensbi mailing list
>>> opensbi at lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/opensbi



