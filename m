From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sun, 14 Nov 2021 00:18:41 +0000
Subject: [PATCH] lib: utils/serial: Modify uart_getc to a blocking function
In-Reply-To: <67b41261e2085c526b94eead382f8a47fd09ecab.camel@126.com>
References: <20211113070622.90364-1-wxjstz@126.com>
 <81552989-313B-46A5-9C21-DFF37C527C06@jrtc27.com>
 <67b41261e2085c526b94eead382f8a47fd09ecab.camel@126.com>
Message-ID: <9281DC8C-5B0B-4CED-803F-AFC62CA72B74@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14 Nov 2021, at 00:16, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-11-13???? 22:11 +0000?Jessica Clarke???
>> On 13 Nov 2021, at 07:06, Xiang W <wxjstz@126.com> wrote:
>>> 
>>> If uart_getc is non-blocking, if the sending end is faster than the
>>> receiving end, the data received by some functions(sbi_gets) is
>>> incomplete
>> 
>> Without hardware flow control this is always going to be true. Making
>> getc blocking does not change that. Moreover, making it blocking
>> means
>> there is no longer a way to poll, whereas having it be non-blocking
>> means you can poll, and if you want to make it blocking you can
>> always
>> put a loop in the caller (which also avoids putting it in every
>> single
>> driver).
>> 
>> Also, this breaks the SBI getchar call; it?s supposed to be
>> non-blocking, but this makes it blocking, so it is impossible for an
>> OS
>> to poll the SBI console.
> Linux also needs blocking sbi_getc, the following is the source code in
> linux
> 
> static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
> {
> 	int i, c;
> 
> 	for (i = 0; i < count; i++) {
> 		c = sbi_console_getchar();
> 		if (c < 0)
> 			break;
> 		buf[i] = c;
> 	}
> 
> 	return i;
> }
> 
> static const struct hv_ops hvc_sbi_ops = {
> 	.get_chars = hvc_sbi_tty_get,
> 	.put_chars = hvc_sbi_tty_put,
> };

That is non-blocking. It stops as soon as it gets -1.

Also, Linux is not the only OS in existence. Even if Linux did want a
blocking interface, that doesn?t mean that?s what the SBI should
provide.

Don?t change the semantics of existing SBI calls, otherwise what?s the
point of freezing specs.

Jess


