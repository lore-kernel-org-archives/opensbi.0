From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 12 Jul 2021 13:46:24 +0100
Subject: [PATCH 1/1] include: types: Use __builtin_offsetof when supported
In-Reply-To: <20210712123959.58251-1-Alexander.Richardson@cl.cam.ac.uk>
References: <20210712123959.58251-1-Alexander.Richardson@cl.cam.ac.uk>
Message-ID: <D8AA0359-B157-4694-A424-37A1EA073F77@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2021, at 13:39, Alex Richardson <Alexander.Richardson@cl.cam.ac.uk> wrote:
> 
> Clang provides a __builtin_offsetof which can be detected using
> __has_builtin().
> 
> Signed-off-by: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
> ---
> include/sbi/sbi_types.h | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
> index 38e3565..7fb1af7 100644
> --- a/include/sbi/sbi_types.h
> +++ b/include/sbi/sbi_types.h
> @@ -68,8 +68,14 @@ typedef unsigned long		physical_size_t;
> #define likely(x) __builtin_expect((x), 1)
> #define unlikely(x) __builtin_expect((x), 0)
> 
> +#ifndef __has_builtin
> +#define __has_builtin(...) 0
> +#endif
> +
> #undef offsetof
> -#ifdef __compiler_offsetof
> +#if __has_builtin(__builtin_offsetof)
> +#define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE,MEMBER)
> +#elif defined(__compiler_offsetof)
> #define offsetof(TYPE, MEMBER) __compiler_offsetof(TYPE,MEMBER)
> #else
> #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

The original code was stolen for Linux, where __compiler_offsetof is
(unconditionally, it seems) defined to __builtin_offsetof. Either
__compiler_offsetof should be defined to __builtin_offsetof or it
should be deleted, but having both still exist is wrong. Personally I?m
of the view OpenSBI should just define offsetof to __builtin_offsetof
directly, it?s already using other GNU C builtins above unconditionally
and __builtin_offsetof has been implemented in both GCC and Clang for
far far longer than RISC-V has existed.

Jess


