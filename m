From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 14 Sep 2023 01:56:06 +0100
Subject: [RFC PATCH] platform: generic: thead: add sfence workaroud for
 th1520/sg2042
In-Reply-To: <IA1PR20MB49538362F56A9241EF72F130BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <37293372-1C99-4F4D-A1E2-35EA6928BEB0@jrtc27.com>
 <IA1PR20MB49538362F56A9241EF72F130BBF7A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <00C6FDC8-36EA-4007-BD69-F8C1D38C63B2@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 Sep 2023, at 01:26, Inochi Amaoto <inochiama@outlook.com> wrote:
> 
>>> so they need to execute sfence.vma in the trap handler to
>>> function properly.
>>> 
>>> To handle this workaroud, add a degraded alternative mechanism in the thead
>>> platform to patch the trap handler.
>> 
>> Don?t mess up generic code for this, just override the trap handler and
>> branch to the generic one after whatever workaround you supposedly need
>> for unclear reasons?
>> 
> 
> Thanks for this advice, I will try a platform trap handler.
> 
>> But this needs a much clearer explanation of whatever?s going on here,
>> which sounds like a spec violation being described to me. What exactly
>> is the hardware erratum and where is it documented?
>> 
>> Jess
>> 
> 
> This is more like a implementation issue rather than spec violation.

Those are two names for the same thing.

Jess

> AFAIK, only th1520 and sg2042 are affected.
> 
> Thanks,
> Inochi


