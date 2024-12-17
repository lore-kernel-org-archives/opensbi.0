From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 17 Dec 2024 12:22:42 +0000
Subject: [RFC 1/5] add build container for ubunti 18.04
In-Reply-To: <EB1522A2-598C-4C5F-AE23-E41C84BF965E@jrtc27.com>
References: <20241202110336.332490-1-ben.dooks@codethink.co.uk>
 <20241202110336.332490-2-ben.dooks@codethink.co.uk>
 <CAAhSdy39weP8Lt3JodJMfXYTyDBRjoVkFr95PjULYh01s88woQ@mail.gmail.com>
 <EB1522A2-598C-4C5F-AE23-E41C84BF965E@jrtc27.com>
Message-ID: <db3c5b7e-ec4b-4e61-b380-31cd3041e491@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15/12/2024 06:38, Jessica Clarke wrote:
> On 15 Dec 2024, at 06:33, Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Dec 2, 2024 at 4:38?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> Typo in subject.
>>
>> s/ubunti/ubuntu/
>>
>>>
>>> Add a podman/docker container for Ubuntu 18.04 for
>>> build testing on older systems which might not have
>>> the same support as a developer has.
> 
> It?s EOL, why bother supporting it at all?

I was going for something old enough to catch anything
unlikely to be supported in things like awk.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

