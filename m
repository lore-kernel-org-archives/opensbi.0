From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Tue, 28 Nov 2023 06:01:33 +0000
Subject: [QUESTION] Usage of negative number notations on unsigned
 numbers.
In-Reply-To: <1c25a9a7-708f-4840-9c7a-a4dedffb2b0a@incoresemi.com>
References: <PN2P287MB0754429FA98AFB8EFD2F4D4BFAB8A@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
 <878r6n76im.fsf@igel.home>
 <PN2P287MB0754BFB8B175A81159CBBF45FABDA@PN2P287MB0754.INDP287.PROD.OUTLOOK.COM>
 <87leajmm8l.fsf@igel.home>
 <1b2d1b62-e6d7-4de2-9d27-4892a0f2a9dd@incoresemi.com>
 <87h6l7mhqn.fsf@igel.home>
 <1c25a9a7-708f-4840-9c7a-a4dedffb2b0a@incoresemi.com>
Message-ID: <84CA5E33-E6C9-4DDD-A66E-423C966624C0@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 28 Nov 2023, at 05:28, Karthik B K <karthik.bk@incoresemi.com> wrote:
> 
> On 27/11/23 19:16, Andreas Schwab wrote:
>> On Nov 27 2023, Karthik B K wrote:
>> 
>>> What's the encoding of (2^32-1)UL and (2^64-1)UL ?
>> A value does not have an encoding.  Only a memory location does.
>> 
> So does a register (container of bits), and a type (signed, unsigned, float).
> 
> The "encoding" is dependent on the "container" (reg or mem) and "type" (signed, unsigned, float).
> 
> The same bits (11...11) would reflect very different values (-1, 2^32-1, quiteNaN).
> 
> The container of (2^32-1) is UInt. 32b unsigned integer. -1 cannot be represented in a 32b unsigned int.
> 
> 
> I'm trying to say, that the unary operator (-) in the expression (-1UL) is an integer arithmetic operator.
> 
> The unary operator (-) when applied to an unsigned type, results in the _negative_ of it's (promoted as per _usual arithmetic conversions_) operand, which in this case, is a signed integer.
> 
> The result will retain this type. Are we assuming an implicit cast ?
> 
> This looks like an illegal set of operations to create the bit pattern we desire (11...11) for an unsigned int.
> 
> 
> Simply put, a -1 in a UL is an oxymoron. Don't you think ?
> 
> Please correct me if I'm wrong.

C99 6.2.5p9:

"The range of nonnegative values of a signed integer type is a subrange
of the corresponding unsigned integer type, and the representation of
the same value in each type is the same.31) A computation involving
unsigned operands can never overflow, because a result that cannot be
represented by the resulting unsigned integer type is reduced modulo
the number that is one greater than the largest value that can be
represented by the resulting type.?

-1UL (parsed as -(1UL); integer constants start with a digit in the
grammar, the - (or leading +) is always a normal unary operator) is
thus well-defined.

If you want to learn C, I?d rather not see it happen on this list.

Jess


