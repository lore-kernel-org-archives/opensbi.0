From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Tue, 12 Nov 2024 09:04:41 +0000
Subject: [PATCH v2 03/11] scripts/carray.sh: Avoid useless use of cat
In-Reply-To: <c8cad6a3-6ba9-4c52-8a1c-0a1f270c7ff3@codethink.co.uk>
References: <20241111220304.1228821-1-samuel.holland@sifive.com>
 <20241111220304.1228821-4-samuel.holland@sifive.com>
 <c8cad6a3-6ba9-4c52-8a1c-0a1f270c7ff3@codethink.co.uk>
Message-ID: <d57b7c17-6f7e-4f72-bf02-fe89dcc21206@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/11/2024 07:13, Ben Dooks wrote:
> On 11/11/2024 22:02, Samuel Holland wrote:
>> awk(1) takes input files as positional arguments, so there is no need
>> to read the file with cat(1).
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v2:
>> ? - New patch for v2
>>
>> ? scripts/carray.sh | 6 +++---
>> ? 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/carray.sh b/scripts/carray.sh
>> index 72808697..16c6c136 100755
>> --- a/scripts/carray.sh
>> +++ b/scripts/carray.sh
>> @@ -43,19 +43,19 @@ if [ ! -f "${CONFIG_FILE}" ]; then
>> ????? usage
>> ? fi
>> -TYPE_HEADER=`cat ${CONFIG_FILE} | awk '{ if ($1 == "HEADER:") 
>> { printf $2; exit 0; } }'`
>> +TYPE_HEADER=$(awk '{ if ($1 == "HEADER:") { printf $2; exit 0; } }' 
>> "${CONFIG_FILE}")
>> ? if [ -z "${TYPE_HEADER}" ]; then
>> ????? echo "Must specify HEADER: in input config file"
>> ????? usage
>> ? fi


Thinking about this, we could just change the entire .sh to an .awk
file, with a few minor changes to argument passing. Patch is sort of
done as follows. I think it would be a reasonable change, so could
send this as a patch pre or post your work, or as a patch to integrate:

#!/usr/bin/awk -f

function usage()
{
     echo "Usage:"
     echo " $0 [options]"
     echo "Options:"
     echo "     -h                   Display help or usage"
     echo "     -l <variable_list>   List of variables in the array 
(Optional)"
     exit 1;
}

BEGIN {
     VAR_LIST[0] = ""; delete VAR_LIST[0]

     for (ArgIndex = 1; ArgIndex < ARGC; ArgIndex++) {
	Arg = ARGV[ArgIndex];

	if (Arg !~ /^-./) { continue; }
	ARGV[ArgIndex] = "";

	if (Arg == "-h") {
	    usage();
	} else if (Arg == "-l") {
	    ArgIndex++;
	    split(ARGV[ArgIndex], Args," ")
	    for (A in Args) {
		VAR_LIST[length(VAR_LIST)] = Args[A];
	    }
	    ARGV[ArgIndex] = "";
	} else {
	    usage() > "/dev/stderr"
	}
     }
}

/^HEADER:/	{ TYPE_HEADER = $2 }
/^TYPE:/	{ for (i = 2; i <= NF; i++) { TYPE_NAME = TYPE_NAME " " $i } }
/^NAME:/	{ ARRAY_NAME = $2}

END {
     if (0 == 1) {
	print "ARRAY_NAME  " ARRAY_NAME
	print "TYPE_HEADER " TYPE_HEADER
	print "TYPE_NAME   " TYPE_NAME

	print length(VAR_LIST)
	for (v in VAR_LIST) {
	    print "VAR_LIST " v  " = " VAR_LIST[v]
	}
     }

     if (length(ARRAY_NAME) == 0) {
	print "Must specify NAME: in input config file"  > "/dev/stderr"
	usage() > "/dev/stderr"
     }

     if (length(TYPE_NAME) == 0) {
	print "Must specify TYPE: in input config file"  > "/dev/stderr"
	usage() > "/dev/stderr"
     }

     if (length(TYPE_HEADER) == 0) {
	print "Must specify HEADER: in input config file"  > "/dev/stderr"
	usage() > "/dev/stderr"
     }

     printf "// Generated with %s from %s\n", SCRIPT_NAME, CONFIG_FILE
     printf("#include <%s>\n\n", TYPE_HEADER)

     for (v in VAR_LIST) {
	printf("extern%s %s;\n", TYPE_NAME, VAR_LIST[v])
     }
     print ""

     printf("%s *%s[] = {\n", TYPE_NAME, ARRAY_NAME)
     for (v in VAR_LIST) {
	printf("\t&%s,\n", VAR_LIST[v])
     }
     printf("\tNULL,\n");

     printf("};\n\n");
}



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

