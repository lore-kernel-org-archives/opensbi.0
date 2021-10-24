From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 24 Oct 2021 19:42:51 +0100
Subject: [PATCH] lib: utils/reset: Add voltage level for gpio_reset
In-Reply-To: <86683d07de677fd2f25700857b3ab6255a04734b.camel@126.com>
References: <20211024164642.810274-1-wxjstz@126.com>
 <293C7F25-1B4C-4F11-832F-0FF89C4F14FC@jrtc27.com>
 <c5697b18296e0b0d670ea95cb38dca766971651c.camel@126.com>
 <CD2FA1E4-9B02-4763-8208-F976B2938974@jrtc27.com>
 <86683d07de677fd2f25700857b3ab6255a04734b.camel@126.com>
Message-ID: <3A26936C-258C-4408-B782-1C7922F0768B@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24 Oct 2021, at 19:09, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-10-24???? 18:26 +0100?Jessica Clarke???
>>>> 
>>>> This property is neither documented in the binding specification
>>>> for
>>>> gpio-restart nor is it checked by Linux.
>>> 
>>> This DT is only processed by opensbi, and linux should be reset
>>> through
>>> the sbi interface, instead of controlling gpio to perform the reset
>>> by
>>> itself.
>> 
>> Well, there are several things going on:
>> 
>> 1. In general, you can?t just make up properties in the global
>>    namespace, that?s how you end up with the kind of mess device
>> trees
>>    have the reputation of having
>> 2. Linux doesn?t need this property and supports far more hardware
>> than
>>    OpenSBI does, so why does OpenSBI need knowledge of this property
>> but
>>    Linux doesn?t on any platform for any architecture?
>> 3. OpenSBI doesn?t provide the device tree, in general, pre-OpenSBI
>>    firmware does, be it U-Boot SPL or something else, and in general
>> that
>>    device tree *will* make its way all the way to the OS. Linux might
>> go and
>>    ignore that and use its own device tree because the whole
>> situation is a
>>    mess, but that?s not the point, this can and will be exposed to
>> OSes running
>>    on top.
>> 
>> Jess
> 
> These attributes are under the gpio-restart/gpio-poweroff node and are
> not global attributes.

By global I mean they do not have a vendor prefix. They occupy the
global namespace of gpio-restart/gpio-poweroff property names that is
reserved for standard properties. To quote the devicetree specification:

> Nonstandard property names should specify a unique string prefix, such
> as a stock ticker symbol, identifying the name of the company or
> organization that defined the property.

This is a nonstandard property, therefore this patch is in violation of
that.

> If you need to rename, you can submit a new
> patch. The rename is added to the current patch, and the commit cannot
> be kept clean

The onus is on the patch submitter to do the right thing, not the
reviewer to fix the submitter?s mistakes.

Jess


