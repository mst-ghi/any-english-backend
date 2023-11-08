--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-1ubuntu1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-1ubuntu1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: lightner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lightner (
    id text NOT NULL,
    user_id text NOT NULL,
    word_id text,
    phrase_id text,
    level smallint DEFAULT 4 NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.lightner OWNER TO postgres;

--
-- Name: phrases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phrases (
    id text NOT NULL,
    word_id text,
    phrase text NOT NULL,
    meaning text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.phrases OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id text NOT NULL,
    user_id text NOT NULL,
    token text NOT NULL,
    r_token text NOT NULL,
    invoked boolean DEFAULT false NOT NULL,
    expires_at timestamp(3) without time zone NOT NULL,
    r_expires_at timestamp(3) without time zone NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    fullname text NOT NULL,
    password text NOT NULL,
    access text DEFAULT 'user'::text NOT NULL,
    status text DEFAULT 'active'::text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words (
    id text NOT NULL,
    word text NOT NULL,
    meaning text,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.words OWNER TO postgres;

--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
4203d46f-2b69-40f3-afe3-35a3fe54e9b2	aae503d92123334382c1964b72cba7baeaded7edd9a45b8f5efe8c96b074a4fe	2023-10-26 08:34:12.711985+03:30	20231026050412_init	\N	\N	2023-10-26 08:34:12.657712+03:30	1
f5fa9145-4df5-4032-8266-0ef0ca06abd8	64c99fb20931dbed6b6326037cf597e12fb4d7173a1e95bf99eab4111c7f6a1b	2023-11-05 10:01:17.9434+03:30	20231105063117_init	\N	\N	2023-11-05 10:01:17.915877+03:30	1
1f63eb57-3632-4ab5-b0f3-ed8b05a7ebc5	9649710d968301dd8434c3eb63af6da3bc219d4537276635c88b86f64f21ced6	2023-11-05 10:28:51.792374+03:30	20231105065851_init	\N	\N	2023-11-05 10:28:51.778858+03:30	1
\.


--
-- Data for Name: lightner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lightner (id, user_id, word_id, phrase_id, level, created_at) FROM stdin;
clony0gbo0005lyq1in34cmct	clo6q6r0r0000lyedmjryjryy	\N	clo6rjufh0004lyi63njf6j4h	4	2023-11-07 06:21:12.229
clony0gx80007lyq1a1uh8hf1	clo6q6r0r0000lyedmjryjryy	\N	clo6rkydx0007lyi641maow9v	4	2023-11-07 06:21:13.005
clony0hfs0009lyq11otnz8uk	clo6q6r0r0000lyedmjryjryy	\N	cloa4ynk50004ly2sas4it954	4	2023-11-07 06:21:13.673
clonvuad0000jlypuit8pqjb0	clo6q6r0r0000lyedmjryjryy	cloa5mklj000mly2svd8bg2qi	\N	4	2023-11-07 05:20:25.333
clonvuayc000llypuv39gms23	clo6q6r0r0000lyedmjryjryy	cloa55tkd000hly2sr3sy5jt1	\N	4	2023-11-07 05:20:26.1
clonvubtv000nlypuv1x5x8lj	clo6q6r0r0000lyedmjryjryy	cloa5464z000cly2sjkendp78	\N	4	2023-11-07 05:20:27.235
clonvuc9r000plypuiw73ohbt	clo6q6r0r0000lyedmjryjryy	cloa4zjko0007ly2sqfgmdfv7	\N	4	2023-11-07 05:20:27.807
clonvud67000rlypuk8pmzz76	clo6q6r0r0000lyedmjryjryy	cloa4y0sl0002ly2s5sng56qa	\N	4	2023-11-07 05:20:28.975
clonvudm2000tlypuwmk5ssv9	clo6q6r0r0000lyedmjryjryy	clo6rkghh0005lyi6u8thll6d	\N	4	2023-11-07 05:20:29.547
clonvudzz000vlypuumor04in	clo6q6r0r0000lyedmjryjryy	clo6rjb220002lyi6gan1si63	\N	4	2023-11-07 05:20:30.048
\.


--
-- Data for Name: phrases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phrases (id, word_id, phrase, meaning, created_at) FROM stdin;
clo6rjufh0004lyi63njf6j4h	clo6rjb220002lyi6gan1si63	The sun is up now.	خورشید الان در آسمان است.	2023-10-26 05:48:14.67
clo6rkydx0007lyi641maow9v	clo6rkghh0005lyi6u8thll6d	Don't be angry.	عصبانی نباش.	2023-10-26 05:49:06.454
cloa4ynk50004ly2sas4it954	cloa4y0sl0002ly2s5sng56qa	Mori and Tara are here.	موری و تارا اینجا هستند.	2023-10-28 14:26:59.142
cloa4z66w0006ly2s9gblmvo0	cloa4y0sl0002ly2s5sng56qa	Come and see me.	بیا و منو ببین.	2023-10-28 14:27:23.288
cloa50tts0009ly2sxo8dk1pm	cloa4zjko0007ly2sqfgmdfv7	Walk ahead of me.	جلوی من راه برو.	2023-10-28 14:28:40.576
cloa51gdc000bly2sph2crpix	cloa4zjko0007ly2sqfgmdfv7	I'm afraid of bears.	من از خرس ها میترسم.	2023-10-28 14:29:09.793
cloa54l5n000ely2sw8vqmi1w	cloa5464z000cly2sjkendp78	Please come in.	لطفا بیاید داخل.	2023-10-28 14:31:35.964
cloa552b0000gly2spwg8ozoh	cloa5464z000cly2sjkendp78	We are in class.	ما داخل کلاس هستیم.	2023-10-28 14:31:58.188
cloa56gzh000jly2ss5kxhkzq	cloa55tkd000hly2sr3sy5jt1	Leave it to me.	بسپارش به من.	2023-10-28 14:33:03.869
cloa56uh1000lly2s3ukvfxvk	cloa55tkd000hly2sr3sy5jt1	Don't lie to me.	به من دروغ نگو.	2023-10-28 14:33:21.349
cloa5n1sv000oly2s1af6fgh9	cloa5mklj000mly2svd8bg2qi	We have a class now.	ما الان یه کلاس داریم.	2023-10-28 14:45:57.343
cloa5nnna000qly2svbp1dtor	cloa5mklj000mly2svd8bg2qi	Have a nice time.	اوقات خوشی داشته باشید.	2023-10-28 14:46:25.655
cloa5rflc000tly2scl3rd92x	cloa5pm51000rly2sjaq71itq	I use it for my car.	من از آن برای ماشینم استفاده میکنم.	2023-10-28 14:49:21.84
cloa5rrcw000vly2sjg4cklb9	cloa5pm51000rly2sjaq71itq	It is easy.	آن آسان است.	2023-10-28 14:49:37.088
cloa5t53t000yly2skd5067pv	cloa5sta7000wly2sxop4t2u7	What is that?	آن چیست؟	2023-10-28 14:50:41.561
cloa5uq5l0010ly2sjjranpyo	cloa5sta7000wly2sxop4t2u7	I heard that you are coming.	من شنیدم که داری می آیی.	2023-10-28 14:51:55.497
cloa5vx560013ly2szgxw1pqb	cloa5vbjd0011ly2sinj5t1dn	Thank you for today.	ازت برای امروز ممنونم.	2023-10-28 14:52:51.21
cloa5x8m20015ly2s3btyotoa	cloa5vbjd0011ly2sinj5t1dn	I make a doll for julie.	من یک عروسک برای جولی درست میکنم.	2023-10-28 14:53:52.73
cloa5y8d60018ly2sly0i40uh	cloa5xwej0016ly2sj232huq9	You must go.	تو باید بری.	2023-10-28 14:54:39.067
cloa5yl3u001aly2sm2bhftdg	cloa5xwej0016ly2sj232huq9	Are you ready?	آیا تو آماده ای؟	2023-10-28 14:54:55.579
cloa5zlob001dly2s9rdwagzc	cloa5z0qz001bly2syj7ztgq8	He is my best friend.	او بهترین دوست من است.	2023-10-28 14:55:42.972
cloa606l0001fly2sg0sbcwu4	cloa5z0qz001bly2syj7ztgq8	He is coming here.	او درحال آمدن به اینجا است.	2023-10-28 14:56:10.068
cloa627sd001ily2sy04n3xxq	cloa61jz0001gly2sk2jznyjh	Come with me please.	با من بیا لطفا.	2023-10-28 14:57:44.942
cloa62jjq001kly2saxf5pw2v	cloa61jz0001gly2sk2jznyjh	I agree with you.	باهات موافقم.	2023-10-28 14:58:00.182
cloa63izi001nly2sa396mwtz	cloa6312d001lly2snlt6dc7c	What is on the desk?	چه چیزی روی میز است؟	2023-10-28 14:58:46.11
cloa6406u001ply2sl6bn3043	cloa6312d001lly2snlt6dc7c	you can count on me.	تو میتونی روی من حساب کنی.	2023-10-28 14:59:08.406
cloa64w6m001sly2s36yrvdjl	cloa64bvq001qly2sds81ctsb	Do it yourself.	خودت انجامش بده.	2023-10-28 14:59:49.871
cloa65ivj001uly2s4es8tdh7	cloa64bvq001qly2sds81ctsb	I know what to do.	من میدونم چیکار کنم.	2023-10-28 15:00:19.279
cloa66x54001xly2sq156fza9	cloa66bw7001vly2swopbrb5y	I want to say something.	من میخوام چیزی بگم.	2023-10-28 15:01:24.424
cloa67pjn001zly2siqv3lgz8	cloa66bw7001vly2swopbrb5y	Say it out-loud.	با صدای بلند آن را بگویید.	2023-10-28 15:02:01.236
cloa68pep0022ly2stwfwairp	cloa683zl0020ly2sb9pbhedf	This is my mobile Phone.	این موبایل من است.	2023-10-28 15:02:47.714
cloa693lt0024ly2s82xq73bh	cloa683zl0020ly2sb9pbhedf	This is not fair.	این منصفانه نیست.	2023-10-28 15:03:06.114
cloa6a26q0027ly2sv2wt8o2g	cloa69cyg0025ly2sz8fsztl2	They are coming here.	آنها در حال آمدن به اینجا هستند.	2023-10-28 15:03:50.93
cloa6ah6i0029ly2sla3agp5n	cloa69cyg0025ly2sz8fsztl2	They are my family.	آنها خانواده من هستند.	2023-10-28 15:04:10.363
cloa6o6ww0002ly6b6ufq6tui	cloa6nukx0000ly6biofk4ixf	I'm at home.	من در خانه هستم.	2023-10-28 15:14:50.24
cloa6ol0w0004ly6bu3k6wl6n	cloa6nukx0000ly6biofk4ixf	Look at me.	به من نگاه کن.	2023-10-28 15:15:08.528
cloa6q1f30007ly6bmopkm11k	cloa6pbja0005ly6b9gzmob1a	Excuse me! but I'm tired.	ببخشید! اما من خسته ام.	2023-10-28 15:16:16.432
cloa6qttz0009ly6b3wdih49h	cloa6pbja0005ly6b9gzmob1a	I was tired but I kept studing.	من خسته بودم اما به مطالعه ادامه دادم.	2023-10-28 15:16:53.255
cloa6rtg6000cly6bj2aesku2	cloa6r8ae000aly6bicnwvpg3	We are learning english.	ما انگلیسی یاد میگیریم.	2023-10-28 15:17:39.414
cloa6sgim000ely6b9ginrg45	cloa6r8ae000aly6bicnwvpg3	We are here and ready.	ما اینجا هستیم و آماده ایم.	2023-10-28 15:18:09.311
cloa6tb9a000hly6bxovqdqof	cloa6st1i000fly6b26r0vb5c	Jack lost his job.	جک کارش را از دست داد.	2023-10-28 15:18:49.15
cloa6tvra000jly6b8mr7qd6s	cloa6st1i000fly6b26r0vb5c	His wife is an American.	همسر او یک آمریکایی هست.	2023-10-28 15:19:15.719
cloa6uwjy000mly6blzelsi8d	cloa6ubly000kly6bs4eneamm	I come from Canada.	من اهل کانادا هستم.	2023-10-28 15:20:03.407
cloa6vu2m000oly6bfehaq64r	cloa6ubly000kly6bs4eneamm	How far is it from here?	آن چقدر از اینجا دور است.	2023-10-28 15:20:46.847
cloa6x6xb000rly6bvrjd73d4	cloa6w9wm000ply6bzxqxz600	It's not my fault.	این اشتباه من نیست.	2023-10-28 15:21:50.16
cloa6xli0000tly6behfz8dsq	cloa6w9wm000ply6bzxqxz600	I'm not from here.	من اهل اینجا نیستم.	2023-10-28 15:22:09.048
cloa70d7c000wly6bm2vxxhuj	cloa6y81z000uly6bsepomkio	Let's go by car.	بیا با ماشین بریم.	2023-10-28 15:24:18.264
cloa711pd000yly6bm7fv9tcw	cloa6y81z000uly6bsepomkio	May I pay by credit card?	آیا ممکن است با کارت اعتباری پرداخت کنم؟	2023-10-28 15:24:50.018
cloa721400011ly6btzirh1xf	cloa71j0w000zly6bdsozw6tz	She is my girlfriend.	او دوست دختر من است.	2023-10-28 15:25:35.904
cloa72enk0013ly6b3y0tpk0d	cloa71j0w000zly6bdsozw6tz	She is a doctor.	او یک دکتر است.	2023-10-28 15:25:53.457
cloa73xht0016ly6bqvwyy7au	cloa72zgf0014ly6bt3a8hhby	Do you want a cup of tea or coffee?	آیا یک فنجان چای میخواهید یا قهوه؟	2023-10-28 15:27:04.53
cloa758w10018ly6bt6f0wgqw	cloa72zgf0014ly6bt3a8hhby	Are you listening to me or not?	آیا به من گوش میدهی یا نه؟	2023-10-28 15:28:05.954
cloa76pe2001bly6bw1mawfmk	cloa75wrt0019ly6b8t4xds5k	Let me do as you like.	بگذار آنطور که تو دوست داری انجام دهم.	2023-10-28 15:29:13.995
clobdl4ns003rlyi8gx3w2ds1	clobdkj0d003plyi8kz5m2z2z	We arrived first.	ما اول رسیدیم.	2023-10-29 11:16:10.841
cloa77in6001dly6bl2mni9cv	cloa75wrt0019ly6b8t4xds5k	I'm working as a teacher.	من بعنوان یک معلم کار میکنم.	2023-10-28 15:29:51.906
cloa795kq001gly6blkt9nkop	cloa78onv001ely6bs6rsyyr6	What is your name?	اسمت چیست؟	2023-10-28 15:31:08.283
cloa79nyj001ily6bgnzg2yb0	cloa78onv001ely6bs6rsyyr6	That is what I like.	ان چیزی است که من دوست دارم.	2023-10-28 15:31:32.108
cloa7atd0001lly6b3508pkm0	cloa7a06z001jly6b2jfpspx5	I go to work by bus every day.	من هر روز با اتوبوس به سره کار میروم.	2023-10-28 15:32:25.764
cloa7be8p001nly6bb3xq0fe9	cloa7a06z001jly6b2jfpspx5	Let me go with you.	بگذار با تو بیایم.	2023-10-28 15:32:52.825
cloazw7xp0002lyokoqq2rp3z	cloazvame0000lyokqcxjgdjj	They have their own troubles.	آنها مشکلات خودشان را دارند.	2023-10-29 04:52:53.678
cloazwyx80004lyokedximrug	cloazvame0000lyokqcxjgdjj	They have to repair their car.	آنها باید ماشین شان را تعمیر کنند.	2023-10-29 04:53:28.653
clob0cwkk0007lyokso71tmpt	cloazxgr60005lyok3apwfni2	can you come?	آیا میتوانی بیایی؟	2023-10-29 05:05:52.1
clob0dml90009lyokrdjosi6e	cloazxgr60005lyok3apwfni2	you can play outside	می توانی بیرون بازی کنی	2023-10-29 05:06:25.822
clob0ecu2000clyoko1akez1y	clob0dy6w000alyokwzzv7zgv	Who are you?	تو کی هستی؟	2023-10-29 05:06:59.835
clob0este000elyokqpwout17	clob0dy6w000alyokwzzv7zgv	Who is next?	نفر بعدی چه کسی است؟	2023-10-29 05:07:20.546
clob0gu1g000hlyokxcwapzj6	clob0ga7f000flyokl5i7bd93	Where can I get a taxi?	کجا میتوانم یه تاکسی بگیرم؟	2023-10-29 05:08:55.444
clob0hr57000jlyokhhyj8kww	clob0ga7f000flyokl5i7bd93	I don't get what you mean.	نمیتوانم منظور شما را متوجه شوم.	2023-10-29 05:09:38.348
clob0izcc000mlyokeuf91dqa	clob0i8no000klyokgrwh6w42	If you want something, try for it.	اگر چیزی را میخواهی برای آن تلاش کن.	2023-10-29 05:10:35.628
clob0jrku000olyokft13zk6m	clob0i8no000klyokgrwh6w42	You can go if you want it.	تو میتوانی بروی اگر میخواهی.	2023-10-29 05:11:12.222
clob0nqj2000rlyokdlow73o1	clob0m5ma000plyokzakv75xs	Would you please open the window?	آیا تمایل داری پنجره را باز کنی؟	2023-10-29 05:14:17.486
clob0okcy000tlyok637hpw9a	clob0m5ma000plyokzakv75xs	Would you like some cake?	آیا مقداری کیک میخواهی؟	2023-10-29 05:14:56.147
clob0pmuq000wlyokstlsc0x8	clob0p7nl000ulyoklhc4otge	Do you know her?	آیا او را میشناسی؟	2023-10-29 05:15:46.034
clob0q4or000ylyokebp28xq4	clob0p7nl000ulyoklhc4otge	Her eyes are blue.	چشم های او آبی هستند.	2023-10-29 05:16:09.147
clob0qwi60011lyokta6dvdeq	clob0qgwd000zlyokwxu9mpyo	I was out all day.	من تمام روز بیرون بودم.	2023-10-29 05:16:45.199
clob0rstd0013lyok3yxepshr	clob0qgwd000zlyokwxu9mpyo	I'm busy all the time.	من همه اوقات سرم شلوغ است.	2023-10-29 05:17:27.074
clob0sp700016lyok4or1sler	clob0s6p60014lyokl5rmg2ru	It's now my turn.	الان نوبت من است.	2023-10-29 05:18:09.036
clob0t2050018lyok6cy4uwie	clob0s6p60014lyokl5rmg2ru	My father is out.	پدر من بیرون است.	2023-10-29 05:18:25.638
clob0v9sk001blyokg39iwnif	clob0uokq0019lyokw54q6nvb	You make me happy.	تو مرا شاد میکنی.	2023-10-29 05:20:09.044
clob0vv8m001dlyokszusywaz	clob0uokq0019lyokw54q6nvb	How did you make it?	چطور آن را درست کردی؟	2023-10-29 05:20:36.839
clob0xgok001glyoko3y0bn30	clob0wtoi001elyokcf6v7ywa	Don't worry about it.	در موردش نگران نباش.	2023-10-29 05:21:51.285
clob0y166001ilyokxjbldiox	clob0wtoi001elyokcf6v7ywa	Please think about it.	لطفا در مورد آن فکر کنید.	2023-10-29 05:22:17.839
clob0yxcp001llyok8gm5jeo5	clob0yizr001jlyokzogwg3i2	I know you very well.	من خوب میشناسمت.	2023-10-29 05:22:59.545
clob0zo83001nlyoktum5no0v	clob0yizr001jlyokzogwg3i2	How should I know?	من چطور/ازکجا باید بدانم؟	2023-10-29 05:23:34.371
clob112tr001qlyokwsyankmu	clob10idn001olyok1aq56hnl	I will try it again.	من دوباره آن را سعی خواهم کرد.	2023-10-29 05:24:39.952
clob11ndr001slyokhanu4kpc	clob10idn001olyok1aq56hnl	Will you go, too?	آیا توام خواهی رفت؟	2023-10-29 05:25:06.591
clob12g93001vlyokdxave1bl	clob123z5001tlyok13afgc9r	Prices went up.	قیمت ها بالا رفتند.	2023-10-29 05:25:44.008
clob139us001xlyokuww1kom6	clob123z5001tlyok13afgc9r	I jumped up quickly.	من سریعا به بالا پریدم.	2023-10-29 05:26:22.372
clob15ylg0020lyokzouqcqrq	clob15gli001ylyok1p6utz7e	I must by one.	من باید یکی بخرم.	2023-10-29 05:28:27.748
clob16dor0022lyokddl3hlxf	clob15gli001ylyok1p6utz7e	This one is better.	این یکی بهتر است.	2023-10-29 05:28:47.308
clob17fhv0025lyokvzuwsz6o	clob16z360023lyokmnd1gr5s	I need more time.	به زمان بیشتری نیاز دارم.	2023-10-29 05:29:36.307
clob17xa10027lyokhqzv71b2	clob16z360023lyokmnd1gr5s	It's time for dinner.	وقت شام است.	2023-10-29 05:29:59.354
clob1961l002alyokf7bly2w0	clob18co20028lyokc7w0ecja	There is a man at the door.	مردی آنجا در ورودی در است.	2023-10-29 05:30:57.37
clob19t1d002clyoklocqeutv	clob18co20028lyokc7w0ecja	There is no place like home.	هیچ جایی شبیه خانه نیست.	2023-10-29 05:31:27.17
clob1e878002flyok0t7675dh	clob1dlzo002dlyokhcmg5h3o	It took me a year to finish.	برای من یک سال طول کشید که تمام شود.	2023-10-29 05:34:53.445
clob1evg8002hlyokdykdwk1e	clob1dlzo002dlyokhcmg5h3o	We will go to Canada next year.	ما سال بعد به کانادا خواهیم رفت.	2023-10-29 05:35:23.577
clob1fr8v002klyokxnh5nu9v	clob1fc1a002ilyokew61qkt4	I think so.	من اینطور فکر میکنم.	2023-10-29 05:36:04.783
clob1gwm1002mlyok3tts7tnb	clob1fc1a002ilyokew61qkt4	Jack was sick, so he couldn't come.	جک مریض بود بنابراین نتوانست بیاید.	2023-10-29 05:36:58.393
clob1igsd002plyokqdjxv7p6	clob1hxma002nlyok7f8aq2tw	Think before talk.	قبل حرف زدن فکر کن.	2023-10-29 05:38:11.197
clob1j26j002rlyokj0bbjxla	clob1hxma002nlyok7f8aq2tw	I think you are right.	من فکر میکنم حق با توست.	2023-10-29 05:38:38.924
clob1kcva002ulyoktby7yzxl	clob1jn5w002slyoklvlyj0hp	When did you return?	تو چه موقع برگشتی؟	2023-10-29 05:39:39.43
clob1l2d3002wlyokaykrqd5c	clob1jn5w002slyoklvlyj0hp	Look at me when I talk to you.	به من نگاه کن وقتی با تو حرف میزنم.	2023-10-29 05:40:12.472
clob1n3ud002zlyokaq30sy9a	clob1mh4c002xlyok5vv720t0	Which of them is your brother?	کدام یک از آنها برادر توست؟	2023-10-29 05:41:47.702
clob1o9ib0031lyokiofwgnj0	clob1mh4c002xlyok5vv720t0	Could you tell me which way I should go?	آیا میتوانید به من بگویید کدام راه را بباید بروم؟	2023-10-29 05:42:41.7
clob977xl0002lyi8vy7yq42o	clob95iff0000lyi8siaec767	We sometimes see them	ما گاهی اوقات آنها را می‌بینیم	2023-10-29 09:13:23.434
clob98gy10004lyi810g851jh	clob95iff0000lyi8siaec767	I invited them to my party.	من آنها را به پارتی خودم دعوت کردم.	2023-10-29 09:14:21.77
clob9aqr60007lyi8zyoswn7d	clob99eld0005lyi8swxdrvkf	Some people think so.	بعضی از افراد اینطور فکر میکنند.	2023-10-29 09:16:07.795
clob9bi0a0009lyi8bslbbuuq	clob99eld0005lyi8swxdrvkf	We need some money.	ما به مقداری پول نیاز داریم.	2023-10-29 09:16:43.115
clob9cxzv000clyi8fy9fjc2n	clob9buei000alyi83xjlht9v	Get off me.	رهایم کن.	2023-10-29 09:17:50.492
clob9e0ur000flyi8oe08ubt2	clob9dcoz000dlyi8mqjwezsy	Do not make fun of people.	مردم را مسخره نکن.	2023-10-29 09:18:40.852
clob9ezf7000hlyi8sfauuqr0	clob9dcoz000dlyi8mqjwezsy	People learn from experience.	مردم از تجربه می‌آموزند.	2023-10-29 09:19:25.652
clob9gecs000klyi8b1ib0ko2	clob9fbqs000ilyi8m87k5iqq	Take the money and leave here.	پول را بردار و ازینجا برو.	2023-10-29 09:20:31.66
clob9hc84000mlyi8mqv90s0g	clob9fbqs000ilyi8m87k5iqq	Take my hand and dance with me.	دستم را بگیر و با من برقص.	2023-10-29 09:21:15.556
clob9nvmm000plyi8iqp0i5p6	clob9n1q6000nlyi8w831trpk	Jack is out now.	جک الان بیرون است.	2023-10-29 09:26:20.638
clob9oo53000rlyi8xnv8jrop	clob9n1q6000nlyi8w831trpk	Are you ready to go out?	برای بیرون رفتن آماده‌ای?	2023-10-29 09:26:57.592
clob9qf9l000ulyi8d4tcskqf	clob9pdhl000slyi8owt34z4z	Put the cheese into the fridge.	پنیر را داخل یخچال بگذار.	2023-10-29 09:28:19.401
clob9raoo000wlyi8m5482ygi	clob9pdhl000slyi8owt34z4z	Let's go into the garden.	بیا به داخل باغ برویم.	2023-10-29 09:29:00.12
clob9ss1z000zlyi8ko5hhy0a	clob9s2p3000xlyi8ypmromrp	I'm just looking.	من فقط نگاه می‌کنم.	2023-10-29 09:30:09.287
clob9tt4g0011lyi805hry8tu	clob9s2p3000xlyi8ypmromrp	Mori had just arrived.	موری به تازگی رسیده بود.	2023-10-29 09:30:57.328
clob9utxj0014lyi8aw1n3sgw	clob9u7ty0012lyi8pgqncy7m	Let me see.	بزار ببینم.	2023-10-29 09:31:45.031
clob9vcrv0016lyi8vkhi7thp	clob9u7ty0012lyi8pgqncy7m	I want to see you again.	من می‌خواهم دوباره ببینمت.	2023-10-29 09:32:09.451
clob9x5h50019lyi8bttjlj6m	clob9wjr00017lyi857ytk5ed	Everybody loves him.	همه عاشقش هستند.	2023-10-29 09:33:33.305
clob9xrw1001blyi8krip87er	clob9wjr00017lyi857ytk5ed	I told him to come.	من به او گفته بودم بیاید.	2023-10-29 09:34:02.353
clobbyxtp001elyi8v009gaxj	clobby5va001clyi84zxumtn1	Open your eyes	چشمانت را باز کن.	2023-10-29 10:30:55.933
clobbzfol001glyi850p877jc	clobby5va001clyi84zxumtn1	Where is your room?	اتاققت کجاست؟	2023-10-29 10:31:19.077
clobc0ysp001jlyi8w9fddzs1	clobbzqwl001hlyi8zhxbuj9f	Come with me please.	با من بیا لطفاً.	2023-10-29 10:32:30.506
clobc1mbq001llyi88h3030gg	clobbzqwl001hlyi8zhxbuj9f	May I come in?	آیا میشه بیام تو?	2023-10-29 10:33:00.999
clobc5y8i001olyi8vyjuayfv	clobc4r6i001mlyi8ypx6t74c	Could you drive more slowly?	آیا می‌توانی آهسته تر رانندگی کنی؟	2023-10-29 10:36:23.058
clobc747w001qlyi86i3159mt	clobc4r6i001mlyi8ypx6t74c	Tara could swim when she was a child.	تارا وقتی بچه بود می‌توانست شنا کند.	2023-10-29 10:37:17.469
clobc83uz001tlyi84nlu8qko	clobc7k3f001rlyi8ubyqm0du	I must go now?	من الان باید برم؟	2023-10-29 10:38:03.659
clobc8rtw001vlyi8rttdac5m	clobc7k3f001rlyi8ubyqm0du	I'm studying now.	من الان مطالعه می‌کنم.	2023-10-29 10:38:34.724
clobca0zp001ylyi8steamzkw	clobc9cj8001wlyi8azswd001	I'm taller than you.	من از تو قد بلندترم.	2023-10-29 10:39:33.254
clobcat7z0020lyi8ckomkupj	clobc9cj8001wlyi8azswd001	Jack runs faster than me.	جک از من سریعتر می‌دود.	2023-10-29 10:40:09.839
clobcg4ld0023lyi82cqi8lw9	clobcb95p0021lyi8of192bqe	I like your shirt.	من از پیراهنت خوشم می‌آید.	2023-10-29 10:44:17.858
clobcgvjt0025lyi8xseuw35t	clobcb95p0021lyi8of192bqe	You are like your friends.	تو شبیه دوستانت هستی.	2023-10-29 10:44:52.793
clobcr80b0028lyi807ua2p73	clobcoqej0026lyi85j88y1ty	Do you have any other questions?	آیا سال دیگری داری؟	2023-10-29 10:52:55.499
clobcsbjx002alyi86jlh92w4	clobcoqej0026lyi85j88y1ty	This is the other side of that story.	این سمت دیگر از داستان است.	2023-10-29 10:53:46.75
clobctyjn002dlyi86fqjgs30	clobctdeg002blyi8wd95mc5f	How are you?	حالت چطوره؟	2023-10-29 10:55:03.204
clobcukav002flyi8c75oib01	clobctdeg002blyi8wd95mc5f	How was your day?	روزت چطور بود؟	2023-10-29 10:55:31.4
clobcwbje002ilyi8p19lsixp	clobcv91v002glyi8za7wkkxy	Take a deep breath and then relax.	نفس عمیق بکش و سپس استراحت کن.	2023-10-29 10:56:53.355
clobcx9mj002klyi814njolg3	clobcv91v002glyi8za7wkkxy	What did you do then?	سپس شما چه کردی؟	2023-10-29 10:57:37.531
clobcyp9m002nlyi8fud8nuix	clobcxvgz002llyi8s8pgiacx	Please put it back in its place.	لطفاً آن را سر جایش بگذارید.	2023-10-29 10:58:44.459
clobczi47002plyi85h8xlf89	clobcxvgz002llyi8s8pgiacx	The cat is licking its tail.	گربه دمش را می‌لیسد.	2023-10-29 10:59:21.848
clobd2eh6002slyi8zoauklg8	clobd1wuq002qlyi8ohutrhlk	Welcome to our house.	به خونمون خوش اومدی.	2023-10-29 11:01:37.098
clobd38nd002ulyi8z85zce7q	clobd1wuq002qlyi8ohutrhlk	We will try our best.	ما تمام تلاشمان را خواهیم کرد.	2023-10-29 11:02:16.202
clobd3zze002xlyi8ckki76co	clobd3m48002vlyi847jr09az	I have two cars.	من دوتا ماشین دارم.	2023-10-29 11:02:51.626
clobd4r7m002zlyi8in0a27ab	clobd3m48002vlyi847jr09az	I only slept two hours.	من فقط دو ساعت خوابیدم.	2023-10-29 11:03:26.914
clobd61i90032lyi8wrqlh1pn	clobd5cve0030lyi8t1kgzu42	We need more money.	ما پول بیشتری نیاز داریم.	2023-10-29 11:04:26.914
clobd6sab0034lyi8sexxo65o	clobd5cve0030lyi8t1kgzu42	Tell me more about Julie.	درباره جولی بیشتر بهم بگو.	2023-10-29 11:05:01.619
clobd96qw0037lyi8eqwhoajq	clobd7cso0035lyi8kw3pl9ik	Can you mail these for me?	آیا می‌توان اینها را برای من ایمیل کنی؟	2023-10-29 11:06:53.672
clobd9vxn0039lyi8t4xab2fi	clobd7cso0035lyi8kw3pl9ik	Life is getting hard these days.	.این روزها زندگی دارد سخت می‌شود	2023-10-29 11:07:26.315
clobddwm7003clyi8gyhscwq0	clobdbtxl003alyi8sy5jd7lj	I want a coffee please.	من یک قهوه می‌خوام لطفاً.	2023-10-29 11:10:33.824
clobdemjm003elyi88ejjoa6y	clobdbtxl003alyi8sy5jd7lj	Do you want anything else?	آیا چیز دیگری می‌خواهید؟	2023-10-29 11:11:07.426
clobdfkkz003hlyi8jrkqe754	clobdewwj003flyi8ip862k19	I will show you the way.	من راه را به تو نشان خواهم داد.	2023-10-29 11:11:51.54
clobdgby3003jlyi8dohwo3l5	clobdewwj003flyi8ip862k19	Could you tell me the way?	آیا میتوانی راه را به من بگید؟	2023-10-29 11:12:27.004
clobdiol8003mlyi8udzxzg7g	clobdi6p3003klyi8mf3wb53w	Look at me please.	به من نگاه کن لطفاً.	2023-10-29 11:14:16.701
clobdk0r9003olyi8ot2ilvki	clobdi6p3003klyi8mf3wb53w	Let me take a look at it.	اجازه بده من نگاهی به آن بیندازم.	2023-10-29 11:15:19.125
clobdlprh003tlyi8awpl2yvr	clobdkj0d003plyi8kz5m2z2z	Let's do this first of all.	بیا اول این‌ها را انجام دهیم.	2023-10-29 11:16:38.189
clobdmvxm003wlyi8o1wvary2	clobdm7xm003ulyi8yg1oxo6v	we need some sugar also	ما همچنین به مقدار شکر نیاز داریم	2023-10-29 11:17:32.843
clobdnpjy003ylyi8k4q90uwp	clobdm7xm003ulyi8yg1oxo6v	I also like cake	من همچنین کیک هم دوست دارم	2023-10-29 11:18:11.23
clobdou710041lyi8xawv7c4l	clobdo6jl003zlyi8i21dqgxa	this is your new car	این ماشین جدید تو است	2023-10-29 11:19:03.901
clobdp92a0043lyi8bhunbgyb	clobdo6jl003zlyi8i21dqgxa	we want something new	ما چیز جدیدی می‌خواهیم	2023-10-29 11:19:23.17
clobdqmpv0046lyi886wpaluw	clobdpsre0044lyi8ahwxxvt9	I'm here because I love you	من اینجا هستم چون دوست دارم	2023-10-29 11:20:27.523
clobdr8fw0048lyi8nxqc3uxe	clobdpsre0044lyi8ahwxxvt9	I'm hungry because I didn't eat lunch	من گرسنمه چون ناهار نخوردم	2023-10-29 11:20:55.676
clobdsrgv004blyi8ts93a4nv	clobdrok20049lyi8o7zbv3lb	I study English everyday	من هر روز انگلیسی می‌خوانم	2023-10-29 11:22:06.992
clobdt5ks004dlyi81kwk8zxv	clobdrok20049lyi8o7zbv3lb	the days of weeks	روزهای هفته	2023-10-29 11:22:25.276
clobdu03o004glyi8eeyuq3kb	clobdtkj5004elyi89xc32k4b	no problem you can use my car	مشکلی نیست می‌تونی از ماشین من استفاده کنی	2023-10-29 11:23:04.836
clobduci6004ilyi8ynjzvj9e	clobdtkj5004elyi89xc32k4b	use your head	از مغزت استفاده کن	2023-10-29 11:23:20.91
clobdv8m7004llyi8qfftczs1	clobduum9004jlyi8vx5vt2wp	they have no money	آنها هیچ پولی ندارند	2023-10-29 11:24:02.527
clobdvj7y004nlyi8ymvlowu5	clobduum9004jlyi8vx5vt2wp	I said no	من گفتم نه	2023-10-29 11:24:16.27
clobdy4cy004qlyi8mhltd606	clobdxs4b004olyi8od5cjqjp	that man is my uncle	آن مرد عموی من است	2023-10-29 11:26:16.979
clobdyk6o004slyi8h9z8iujz	clobdxs4b004olyi8od5cjqjp	my uncle is a young man	عموی من مرد جوانی است	2023-10-29 11:26:37.488
clobdzjiw004vlyi8qsnyd4ra	clobdz9n4004tlyi87b0sg2h6	come here Jack	بیا اینجا جک	2023-10-29 11:27:23.288
clobe0ify004xlyi8k7jof7w4	clobdz9n4004tlyi87b0sg2h6	please sit here	لطفاً اینجا بشین	2023-10-29 11:28:08.543
clobe2hja0050lyi8mda3r8fu	clobe1wkj004ylyi84ot7z305	why did you say such a thing?	چرا تو چنین چیزی گفتی	2023-10-29 11:29:40.678
clobe3gyc0052lyi89ffqhp73	clobe1wkj004ylyi84ot7z305	we are thinking about the same thing	ما درباره چیزهای مشابه فکر می‌کنیم	2023-10-29 11:30:26.58
clobe4hby0055lyi8ioyyjgve	clobe406k0053lyi8fyoakw7f	give me your hand and close your eyes	دستانت را به من بده و چشمانت را ببند	2023-10-29 11:31:13.727
clobe4zuc0057lyi8wbbdqbm5	clobe406k0053lyi8fyoakw7f	I will give it to you tomorrow	من فردا آن را به تو خواهم داد	2023-10-29 11:31:37.717
clobe62q6005alyi8drkty4mh	clobe5m150058lyi8zlrbtv3x	I have many things to do	من کارهای زیادی برای انجام دادن دارم	2023-10-29 11:32:28.111
clobe6fc3005clyi8csdrp6xn	clobe5m150058lyi8zlrbtv3x	I have many friends	من دوستان زیادی دارم	2023-10-29 11:32:44.451
clobe7nnn005flyi8w4hge9zk	clobe73ea005dlyi8qtfo0hm5	I can swim well	من می‌توانم به خوبی شنا کنم	2023-10-29 11:33:41.892
clobe82ur005hlyi8bqpjxqkm	clobe73ea005dlyi8qtfo0hm5	this engine works well	این موتور به خوبی کار می‌کند	2023-10-29 11:34:01.587
clobeb0wu005klyi8ksixrey0	clobeabs0005ilyi8vkl00xhm	we only spend three dollors	ما فقط ۳ دلار خرج کردیم	2023-10-29 11:36:19.038
clobebiw8005mlyi828tqvtsz	clobeabs0005ilyi8vkl00xhm	I am the only person on the train	من تنها فرد در قطار هستم	2023-10-29 11:36:42.344
clobed1ju005plyi81imty6fi	clobecjej005nlyi8dz80hsmg	those are my friends	آنها دوستان من هستند	2023-10-29 11:37:53.179
clobedniy005rlyi8rqaako3c	clobecjej005nlyi8dz80hsmg	those apples are fresh	آن سیب‌ها تازه هستند	2023-10-29 11:38:21.659
clobef21g005ulyi81abid4ix	clobeed4s005slyi8xyxx3n83	never tell a lie	هرگز دروغ نگو	2023-10-29 11:39:27.124
clobeffv6005wlyi8kqw9ogre	clobeed4s005slyi8xyxx3n83	tell me the truth	به من حقیقت رو بگو	2023-10-29 11:39:45.042
clobeg9j5005zlyi8s33h2hbx	clobefwdf005xlyi89dtz2zl0	we are very happy	ما خیلی خوشحالیم	2023-10-29 11:40:23.489
clobegtpu0061lyi839erb4o6	clobefwdf005xlyi89dtz2zl0	it's very expensive	آن خیلی گران است	2023-10-29 11:40:49.651
clobeiich0064lyi8i5otvczc	clobehcji0062lyi84vrg8uxi	they didn't even try to help	آنها حتی سعی نکردند کمک کنند	2023-10-29 11:42:08.226
clobeji9y0066lyi8z8pqseyw	clobehcji0062lyi84vrg8uxi	twelve as an event number	۱۲ عدد زوج است	2023-10-29 11:42:54.79
clobekomr0069lyi8qg12nnvg	clobekdce0067lyi8npbsplv2	please stand back	لطفاً عقب بایستید	2023-10-29 11:43:49.684
clobeljf8006blyi85lt3rz43	clobekdce0067lyi8npbsplv2	we sat at the back of the bus	ما در عقب اتوبوس نشستیم	2023-10-29 11:44:29.588
clobemkhv006elyi8hlnc2eqo	clobem58d006clyi86gyu8770	do you have any money?	آیا تو هیچ پولی داری	2023-10-29 11:45:17.635
clobeofj9006glyi88md7nzdg	clobem58d006clyi86gyu8770	I must help Julie at any cost	من باید کمک کنم به جولی به هر قیمتی که شده	2023-10-29 11:46:44.518
clobf20vw006jlyi8xziz3ubo	clobf1mcl006hlyi8wmpd1v0x	we have a good relationship	ما رابطه خوبی داریم	2023-10-29 11:57:18.716
clobf2cwz006llyi8m425dlz0	clobf1mcl006hlyi8wmpd1v0x	they are good people	آنها مردم خوبی هستند	2023-10-29 11:57:34.308
clobf3eun006olyi8hujoznc8	clobf2oya006mlyi8ejigbodo	Emma is a wonderful woman	اما زن خوبی است	2023-10-29 11:58:23.472
clobf3tnk006qlyi82jc9yl8e	clobf2oya006mlyi8ejigbodo	I think she's an honest woman	من فکر می‌کنم اون یک زن راستگوست	2023-10-29 11:58:42.657
clobf5vgk006tlyi8um7vf4z5	clobf4ui3006rlyi8pap9c7br	water goes through the pipe	آب از طریق لوله عبور می‌کند	2023-10-29 12:00:18.309
clobf6cy7006vlyi8xz0eugfh	clobf4ui3006rlyi8pap9c7br	you go through a city	تو از میان شهر می‌گذری	2023-10-29 12:00:40.975
clobf80u7006ylyi860rhsqkc	clobf76u6006wlyi8qz02ennm	come and stay with us	بیا و با ما بمان	2023-10-29 12:01:58.591
clobf8z2f0070lyi8k3mitt30	clobf76u6006wlyi8qz02ennm	all of us were silence	همه ما ساکت بودیم	2023-10-29 12:02:42.951
clobf9r1s0073lyi8l5orvlz9	clobf9fu80071lyi8vzgw5pk5	life is beautiful	زندگی زیباست	2023-10-29 12:03:19.216
clobfab3t0075lyi8t9zxvqk8	clobf9fu80071lyi8vzgw5pk5	I own you my life	من زندگیم را به تو مدیونم	2023-10-29 12:03:45.209
clobfbm5y0078lyi8owqgxnxp	clobfb1uk0076lyi8gh1pctzm	I'm no longer a child	من دیگر یک بچه نیستم	2023-10-29 12:04:46.198
clobfccbo007alyi8q6m106uy	clobfb1uk0076lyi8gh1pctzm	mom always treats me like a child	مامان همیشه با من مثل یک بچه رفتار میکنه	2023-10-29 12:05:20.101
clobfd6kf007dlyi8hl5z0u5w	clobfcuto007blyi8z54ks0du	you should work hard	تو باید به سختی کار کنی	2023-10-29 12:05:59.295
clobfdws7007flyi88ax8ttfn	clobfcuto007blyi8z54ks0du	don't be late for work	برای کار دیر نکن	2023-10-29 12:06:33.271
clobffdot007ilyi8fotporvz	clobfebr2007glyi8oiay114z	don't look down you will get dizzy	به پایین نگاه نکن سرت گیج خواهد رفت	2023-10-29 12:07:41.838
clobfge0a007klyi8q6lolj0t	clobfebr2007glyi8oiay114z	the sun is going down and it will be dark soon	خورشید به پایین می‌رود و به زودی تاریک خواهد شد	2023-10-29 12:08:28.906
clobfhqku007nlyi8f8hgl2mx	clobfh32u007llyi88mhy1403	may I go home?	آیا ممکن است به خانه بروم	2023-10-29 12:09:31.855
clobfi57d007plyi89owf3mia	clobfh32u007llyi88mhy1403	we will go to London in May	ما به لندن خواهیم رفت در ماه می	2023-10-29 12:09:50.809
clobfjmil007slyi805xnagro	clobfilcj007qlyi85qlj1zhe	let's for a walk after breakfast	بیا بعد از صبحانه برویم قدم بزنیم	2023-10-29 12:10:59.901
clobfkc23007ulyi8gxvb5mnx	clobfilcj007qlyi85qlj1zhe	some people believe in life after death	بعضی از مردم به زندگی بعد از مرگ اعتقاد دارند	2023-10-29 12:11:33.003
clobfl0iq007xlyi8vpuqrxog	clobfkoyf007vlyi8y6mnxr0c	you should go now	تو باید الان بری	2023-10-29 12:12:04.707
clobflc87007zlyi8a5u1ifjh	clobfkoyf007vlyi8y6mnxr0c	where should we go?	ما کجا باید بریم	2023-10-29 12:12:19.88
clobfm9b00082lyi8dk0a5nf3	clobfly190080lyi86lzx07ui	call the police	به پلیس زنگ بزن	2023-10-29 12:13:02.748
clobfmjho0084lyi8lhnent8m	clobfly190080lyi86lzx07ui	please call him	لطفاً به او زنگ بزن	2023-10-29 12:13:15.949
clobfnwue0087lyi8ftsz9c04	clobfn0760085lyi8ihuvzjn0	Mori traveled all over the world	مری به سراسر جهان سفر کرد	2023-10-29 12:14:19.91
clobfp0pb0089lyi803pkadhc	clobfn0760085lyi8ihuvzjn0	nobody in the world wants war	هیچ کسی در دنیا جنگ نمی‌خواهد	2023-10-29 12:15:11.567
clobfq9mk008clyi805z4dsq7	clobfpks5008alyi8eihxajkv	Emma jumped over the wall	اما روی دیوار پرید	2023-10-29 12:16:09.788
clobfqz1r008elyi85hbjkpfi	clobfpks5008alyi8eihxajkv	Jack must be over fifty	جک باید بالای ۵۰ سالش باشد	2023-10-29 12:16:42.735
clobfvv75008hlyi8f9lpf7ju	clobfvdzf008flyi8xp4u9wz6	where is your school?	مدرسه تو کجاست	2023-10-29 12:20:31.025
clobfwcab008jlyi8dch2spec	clobfvdzf008flyi8xp4u9wz6	I studied hard at the school	من در مدرسه سخت درس می‌خوانم	2023-10-29 12:20:53.171
clobfxkwc008mlyi8iron385q	clobfx9f5008klyi829wa2rf2	I still love her	من هنوز دوسش دارم	2023-10-29 12:21:50.988
clobfya0s008olyi86wppiszj	clobfx9f5008klyi829wa2rf2	it's difficult to stay still for a long time	ساکن ماندن برای مدت طولانی سخت است	2023-10-29 12:22:23.548
clobfz9ya008rlyi88um82wl0	clobfyke1008plyi8odh9f3q2	try to study harder	سعی کن سخت‌تر مطالعه کنی	2023-10-29 12:23:10.115
clobfzpd7008tlyi8ijusiavc	clobfyke1008plyi8odh9f3q2	we will try it once more	ما یک بار دیگر آن را امتحان خواهیم کرد	2023-10-29 12:23:30.091
clobg141q008wlyi8wxtyafzk	clobg0536008ulyi8z14izmyz	we moved here last month	ما ماه گذشته به اینجا منتقل شدیم	2023-10-29 12:24:35.775
clobg1cqv008ylyi8k9nwqq6t	clobg0536008ulyi8z14izmyz	this is the last time	این آخرین بار است	2023-10-29 12:24:47.048
clobg24lm0091lyi8uiw4ki58	clobg1ox2008zlyi8zflh4kmz	why do you ask?	چرا می‌پرسی	2023-10-29 12:25:23.146
clobg2ul00093lyi8trik6qq6	clobg1ox2008zlyi8zflh4kmz	don't ask me for money	از من برای پول درخواست نکن	2023-10-29 12:25:56.82
clobg3jhp0096lyi8b2t2xyxv	clobg36gc0094lyi84tktvzsc	we need more time	ما به زمان بیشتری نیاز داریم	2023-10-29 12:26:29.101
clobg4c3r0098lyi8d7py8a3w	clobg36gc0094lyi84tktvzsc	we need your advices	ما به توصیه‌های شما نیاز داریم	2023-10-29 12:27:06.183
clobg5h7s009blyi8opr2f74v	clobg513h0099lyi8xj5dt46u	me too	منم همینطور	2023-10-29 12:27:59.464
clobg5y81009dlyi862irpryj	clobg513h0099lyi8xj5dt46u	don't eat too much	بیش از اندازه نخور	2023-10-29 12:28:21.505
clobg6u4o009glyi8tlr52lao	clobg6d4a009elyi8a1jt76wh	I feel happy	من احساس خوشحالی می‌کنم	2023-10-29 12:29:02.857
clobg7cln009ilyi88f51cffq	clobg6d4a009elyi8a1jt76wh	how do you feel about it?	چه حسی نسبت به آن داری	2023-10-29 12:29:26.796
clobg8hla009llyi8qsor7x1z	clobg88rb009jlyi8m72qlodn	Jack has three brothers	جک سه برادر دارد	2023-10-29 12:30:19.919
clobg8tt9009nlyi8q8lzrms7	clobg88rb009jlyi8m72qlodn	it's almost 3	ساعت تقریبا ۳ است	2023-10-29 12:30:35.757
clobgajew009qlyi8mj7jugyf	clobg9q5a009olyi8srm1fre9	Emma lives in New York State	اما در ایالت نیویورک زندگی می‌کند	2023-10-29 12:31:55.593
clobgb15f009slyi8err1bra3	clobg9q5a009olyi8srm1fre9	I'm not in a state to drive	من در حالتی نیستم که رانندگی کنم	2023-10-29 12:32:18.579
clobgbo96009vlyi8zul9hpwt	clobgbcoy009tlyi8gi8rg321	it's now or never	یا الان یا هیچ وقت	2023-10-29 12:32:48.522
clobgc2v4009xlyi8354z53gm	clobgbcoy009tlyi8gi8rg321	I never liked math	من هرگز ریاضی را دوست نداشتم	2023-10-29 12:33:07.457
clobgd0mp00a0lyi8i5zsc4rg	clobgchkg009ylyi8uq2eo018	I wanted to become a dotor	من می‌خواستم یک دکتر بشوم	2023-10-29 12:33:51.217
clobgdayi00a2lyi8ew2hotc1	clobgchkg009ylyi8uq2eo018	Julie wants to become famous	جولی می‌خواهد مشهور شود	2023-10-29 12:34:04.603
clobge47j00a5lyi88ffn4a54	clobgdpi800a3lyi8ybxhaq0x	I would come between 5 and 6	من بین ساعت‌های ۵ و ۶ خواهم آمد	2023-10-29 12:34:42.512
clobgf9xa00a7lyi8rr2z393d	clobgdpi800a3lyi8ybxhaq0x	eating between meals is a bad habits	خوردن بین وعده‌های غذایی عادت بدی است	2023-10-29 12:35:36.574
clobggrj300aalyi8lbt77zhp	clobgftlt00a8lyi8cbuz8fyt	Peter received a high Salary	پیتر حقوق بالایی دریافت کرد	2023-10-29 12:36:46.048
clobghicd00aclyi8f5el62ne	clobgftlt00a8lyi8cbuz8fyt	Jack suffers from high blood pressure	جک از فشار خون بالا رنج می‌برد	2023-10-29 12:37:20.798
clobgj0qi00aflyi8tzbxxskr	clobgihhj00adlyi8ol7muvea	I really love Emma	من واقعا عاشق اما هستم	2023-10-29 12:38:31.29
clobgkbla00ahlyi88slr56q2	clobgihhj00adlyi8ol7muvea	I'm really confused	من واقعا سردرگم هستم	2023-10-29 12:39:32.014
clobgljg300aklyi8ko31y0p3	clobgl07l00ailyi8n80fzvbx	is something wrong?	آیا چیزی اشتباه است	2023-10-29 12:40:28.851
clobgls8300amlyi8s8867ivh	clobgl07l00ailyi8n80fzvbx	tell me something new	چیز جدید به من بگو	2023-10-29 12:40:40.227
clobgmtj300aplyi8j1j1pdm2	clobgmi3w00anlyi8c8vmx0pk	most people think so	اکثر مردم اینطور فکر می‌کنند	2023-10-29 12:41:28.576
clobgn8ih00arlyi858fct4ft	clobgmi3w00anlyi8c8vmx0pk	I like most types of fish	من بیشتر انواع ماهی‌ها را دوست دارم	2023-10-29 12:41:47.993
clobgoc6f00aulyi81aivegaj	clobgnq0k00aslyi8xtbz25cx	would you like another cup of tea?	آیا فنجان چای دیگری می‌خواهید	2023-10-29 12:42:39.4
clobgoxmi00awlyi8k78xic37	clobgnq0k00aslyi8xtbz25cx	my passport is valid for another 2 years	پاسپورت من برای مدت دو سال دیگر اعتبار دارد	2023-10-29 12:43:07.194
clobgpqf000azlyi83ai0aiow	clobgpfn100axlyi8h7p32aqe	I have my own room	من اتاق شخصی دارم	2023-10-29 12:43:44.508
clobgq9ql00b1lyi8jqcdfseq	clobgpfn100axlyi8h7p32aqe	Emma has her own car	اما ماشین خودش را دارد	2023-10-29 12:44:09.549
clobgr39200b4lyi8ie64x98x	clobgqrhx00b2lyi8c7f29hx9	leave me alone	تنهایم بگذار	2023-10-29 12:44:47.799
clobgtumu00b6lyi8bgmjkf5n	clobgqrhx00b2lyi8c7f29hx9	I must leave now	من باید الان اینجا را ترک کنم	2023-10-29 12:46:56.598
clobgumc200b9lyi8d7cnp9gp	clobgu5i700b7lyi8fq2ip9de	don't put it on my desk	هان را روی میز من نگذار	2023-10-29 12:47:32.499
clobguynw00bblyi8uqaoqg5i	clobgu5i700b7lyi8fq2ip9de	may I put it here?	آیا ممکن است اینجا بگذارمش	2023-10-29 12:47:48.477
clobgw6kc00belyi8on198k7b	clobgvu1j00bclyi8ya2yef8i	how old are you?	تو چند سالت است	2023-10-29 12:48:45.372
clobgwvd100bglyi82di2159t	clobgvu1j00bclyi8ya2yef8i	grandpa is old but is still full of energy	پدربزرگ پیر است اما هنوز پر از انرژی است	2023-10-29 12:49:17.51
clobgxzj000bjlyi8olgx0bcm	clobgx8hg00bhlyi8z5wllln5	I study English while eating	من در حین غذا خوردن انگلیسی مطالعه میکنم	2023-10-29 12:50:09.565
clobgyok000bllyi85oj3bx69	clobgx8hg00bhlyi8z5wllln5	I'm going out for a while	من برای مدتی به بیرون می‌روم	2023-10-29 12:50:42
clobh0dhi00bolyi8ick0t8xd	clobgz16800bmlyi8zt9bhm1c	what do you mean?	منظورت چیه	2023-10-29 12:52:00.967
clobh0oj200bqlyi84rixwdlv	clobgz16800bmlyi8zt9bhm1c	what does it mean?	معنی آن چیست	2023-10-29 12:52:15.278
clobh1gmo00btlyi8ea4mrpgj	clobh12qu00brlyi8b6d01htj	keep your eyes open	چشمانت را باز نگه دار	2023-10-29 12:52:51.697
clobh1se200bvlyi8n32i4qc3	clobh12qu00brlyi8b6d01htj	can you keep a secret?	آیا میتوانی رازی را نگه داری	2023-10-29 12:53:06.939
clobh2jd300bylyi8ley86q6y	clobh25ka00bwlyi8r0482xib	I'm a student here	من اینجا یک دانشجو هستم	2023-10-29 12:53:41.895
clobh2xkf00c0lyi8t6av5bki	clobh25ka00bwlyi8r0482xib	I have a student visa	من ویزای دانشجویی دارم	2023-10-29 12:54:00.303
clobh3sk600c3lyi8dlkrncy6	clobh3dqa00c1lyi8n3godv76	why don't you go home?	چرا تو به خانه نمی‌روی	2023-10-29 12:54:40.47
clobh423200c5lyi8f5uveoyb	clobh3dqa00c1lyi8n3godv76	nobody knows why	هیچ کسی نمی‌داند چرا	2023-10-29 12:54:52.814
clobhvbr30002lymvl2ry0a4e	clobhv1870000lymvhhxxjv0f	let me see you again	اجازه بده دوباره ببینمت	2023-10-29 13:16:05.056
clobhvp680004lymvy49s7cqv	clobhv1870000lymvhhxxjv0f	let's go to the party	بیا بریم پارتی	2023-10-29 13:16:22.449
clobhwr3p0007lymvds8mx86i	clobhwd9i0005lymvpkl58war	that is really great	آن واقعا عالی است	2023-10-29 13:17:11.606
clobhxd580009lymv8pfgwwjf	clobhwd9i0005lymvpkl58war	Mori is a great teacher	موری معلم بزرگ است	2023-10-29 13:17:40.172
clobhyevt000clymvlkdxh3gk	clobhxzam000alymvxdzix73a	give me the same please	لطفاً به من همان را بدهید	2023-10-29 13:18:29.081
clobhz95q000elymvyat3wae5	clobhxzam000alymvxdzix73a	we treat all our children the same	ما با همه بچه هایمان یکسان رفتار می‌کنیم	2023-10-29 13:19:08.318
clobhzu7j000hlymvk30njvk2	clobhzie0000flymvitye95lz	there is a big Garden in my house	یه باغ بزرگ در خانه من وجود دارد	2023-10-29 13:19:35.6
clobi058f000jlymv5wijxril	clobhzie0000flymvitye95lz	shut your big mouth	دهان گنده‌ات را ببند	2023-10-29 13:19:49.888
clobi1l3p000mlymvf7afhwyp	clobi0uy6000klymvab0kib1i	what is your favorite group?	گروه مورد علاقه تو چیست	2023-10-29 13:20:57.109
clobi352m000olymvab0a51p5	clobi0uy6000klymvab0kib1i	we need someone to work in a group	ما فردی را برای کار گروهی نیاز داریم	2023-10-29 13:22:09.646
clobi8yp7000rlymvyl5z5wye	clobi8htr000plymvjz9rpeth	the movie begins at 7:00	فیلم ساعت ۷ شروع می‌شود	2023-10-29 13:26:41.323
clobi99ir000tlymvh914j6kk	clobi8htr000plymvjz9rpeth	when does it begin?	چه موقع آن شروع می‌شود	2023-10-29 13:26:55.347
clocdnv5x0002lyj1vui0z732	clocdndim0000lyj1nuzn5322	you seem busy	به نظر می‌رسد سرش شلوغ باشد	2023-10-30 04:06:04.678
clocdo9950004lyj1fdcypj63	clocdndim0000lyj1nuzn5322	it seems that you are tired	به نظر می‌رسد خسته‌ای	2023-10-30 04:06:22.937
clocdpc1e0007lyj12v2jz69q	clocdp1ni0005lyj1t70rkub5	I live in the country	من در حومه شهر زندگی می کنم	2023-10-30 04:07:13.203
clocdptpx0009lyj1uf1ttj7x	clocdp1ni0005lyj1t70rkub5	we traveled around the country	ما به دور کشور سفر کردیم	2023-10-30 04:07:36.117
clocds3vb000clyj15xvks8ge	clocdrpzv000alyj1iod7bufz	come and help us	بیا و کمک کن به ما	2023-10-30 04:09:22.584
clocdsg26000elyj187qntoee	clocdrpzv000alyj1iod7bufz	can you help me?	میتونی کمکم کنی	2023-10-30 04:09:38.382
clocdtxbf000hlyj1hebaddkm	clocdtiji000flyj11xyfbhmb	can we talk private?	آیا ما می‌توانیم به صورت خصوصی صحبت کنیم	2023-10-30 04:10:47.404
clocdu4tx000jlyj1peyg5kgm	clocdtiji000flyj11xyfbhmb	talk to me	با من حرف بزن	2023-10-30 04:10:57.141
clocdvgnc000mlyj1uqpseo98	clocduz5r000klyj1sya7r786	where did you go?	شما کجا رفتید	2023-10-30 04:11:59.113
clocdw0z2000olyj1mfsm5bw2	clocduz5r000klyj1sya7r786	that is where the problem is	آن جایی است که مشکل آنجاست	2023-10-30 04:12:25.454
clocdxypu000rlyj1o2mt7syn	clocdwffr000plyj1opffg2ag	turn to the right please	لطفاً به سمت راست بپیچید	2023-10-30 04:13:55.842
clocdygtr000tlyj1dpagsei4	clocdwffr000plyj1opffg2ag	now it's your turn to go inside	حالا نوبت شماست که داخل بروید	2023-10-30 04:14:19.311
clocdz96d000wlyj11w6mf50x	clocdyvf3000ulyj1k3nn00y8	what is the problem?	مشکل چیست	2023-10-30 04:14:56.054
cloce0tr3000ylyj1lq88puqj	clocdyvf3000ulyj1k3nn00y8	this problem seems difficult	این مشکل سخت به نظر می‌رسد	2023-10-30 04:16:09.375
cloce2dwy0011lyj1tqqm809g	cloce1jpt000zlyj18m71fq7i	I run everyday to lose weight	من برای کاهش وزن هر روز می‌دوم	2023-10-30 04:17:22.162
cloce2qpa0013lyj1mivmgx0z	cloce1jpt000zlyj18m71fq7i	do you study English every day?	آیا هر روز انگلیسی مطالعه می‌کنی	2023-10-30 04:17:38.735
cloce3x7m0016lyj1gjszvhja	cloce38bb0014lyj16b3ysg2e	we are ready to start the lesson	ما آماده‌ایم که درس را شروع کنیم	2023-10-30 04:18:33.826
cloce4t3o0018lyj1ld17dueu	cloce38bb0014lyj16b3ysg2e	are you ready to start?	آیا آماده‌ای واسه شروع کردن	2023-10-30 04:19:15.157
cloce5kru001blyj1km3wv7dg	cloce547c0019lyj1cewu6bvy	raise your hands	دستتان را بالا بگیرید	2023-10-30 04:19:51.019
cloce68so001dlyj1y7wpact8	cloce547c0019lyj1cewu6bvy	who wants to play a hand of Poker?	چه کسی می‌خواهد یک دست پوکر بازی کند	2023-10-30 04:20:22.152
cloce7vu7001glyj1n4z44q99	cloce6k0v001elyj1lq00a7ql	I might come and visit you next year	من ممکن است سال دیگر بیایم و شما را ببینم	2023-10-30 04:21:38.672
cloce8rxl001ilyj1uhl7wmjg	cloce6k0v001elyj1lq00a7ql	don't go any closer, it might be dangerous	اصلا جلوتر نرو ممکن خطرناک باشد	2023-10-30 04:22:20.266
cloce9zga001llyj19indawrr	cloce90om001jlyj12xkey8h1	Emma's husband is an American	شوهر اما یک آمریکایی است	2023-10-30 04:23:16.667
clocead86001nlyj1ccjtxrt0	cloce90om001jlyj12xkey8h1	I like American culture	من فرهنگ آمریکایی را دوست دارم	2023-10-30 04:23:34.519
cloceb5js001qlyj1xro3qafs	cloceaw9j001olyj1scy3chsv	I will show you	به تو نشان خواهم داد	2023-10-30 04:24:11.225
clocebfhk001slyj1ff0t44e8	cloceaw9j001olyj1scy3chsv	show me another example	مثال دیگری به من نشان بده	2023-10-30 04:24:24.105
clocecou4001vlyj1anohq93z	clocec5jr001tlyj1a4lrmoie	I'm looking for a part-time job	من به دنبال یک شغل پاره وقت می‌گردم	2023-10-30 04:25:22.877
cloced6n3001xlyj1a4u0yfad	clocec5jr001tlyj1a4lrmoie	learning English is a part of my daily routine	یادگیری انگلیسی بخشی از روتین روزانه من است	2023-10-30 04:25:45.951
clocg1yvb0020lyj1n6o11a8o	clocg12xz001ylyj1wo3kt89h	I'm against your plan	من مخالف پلن شما هستم	2023-10-30 05:13:01.895
clocg2gno0022lyj1luo6ly3p	clocg12xz001ylyj1wo3kt89h	are you against my idea?	آیا تو مخالف ایده من هستی	2023-10-30 05:13:24.948
clocg3y8w0025lyj16uqrwoiz	clocg3gyu0023lyj1z3x0v5ql	you are in a safe place	شما در یک مکان امن هستید	2023-10-30 05:14:34.4
clocg4bb40027lyj19tkmaigk	clocg3gyu0023lyj1z3x0v5ql	we will come to your place	ما به محل شما خواهیم آمد	2023-10-30 05:14:51.329
clocg6aqv002alyj1snysj5vv	clocg5s1g0028lyj1457fipng	that is such a good film	آنچنین فیلم خوبی است	2023-10-30 05:16:23.912
clocg6zmm002clyj1ydclbsd5	clocg5s1g0028lyj1457fipng	he is such an idiot	او چنین آدم احمقی است	2023-10-30 05:16:56.158
clocg7o5x002flyj168nzv7r1	clocg7adg002dlyj1yzpopwxb	do it once again	انجامش بده دوباره	2023-10-30 05:17:27.957
clocg85uf002hlyj1zs02c413	clocg7adg002dlyj1yzpopwxb	please come again	لطفاً دوباره بیایید	2023-10-30 05:17:50.872
clodtnx3o0006lyfiqo1bfz4p	clodtn8q30004lyfixzifzaxl	I usually have few friends	من معمولاً دوستان کمی دارم	2023-10-31 04:21:47.22
clodto6r30008lyfifgme0xng	clodtn8q30004lyfixzifzaxl	Trust few people	به افراد کمی اعتماد کنید	2023-10-31 04:21:59.727
clodtp2z1000blyfi8auwpk56	clodtorws0009lyfi4uh2nm9c	you are wrong in this case	شما در مورد اشتباه می‌کنید	2023-10-31 04:22:41.485
clodtpfa0000dlyfiujicyu7r	clodtorws0009lyfi4uh2nm9c	I want to buy a case of beer	من می‌خواهم یک جعبه آبجو بخرم	2023-10-31 04:22:57.432
clodtqi8m000glyfi5lexlfxm	clodtq1wd000elyfit6ppd60j	I bought it last week	من هفته گذشته آن را خریدم	2023-10-31 04:23:47.927
clodtqyvo000ilyfifu9kfqr6	clodtq1wd000elyfit6ppd60j	I go to London once a week	من هفته یکبار به لندن می‌روم	2023-10-31 04:24:09.493
clodtsng7000llyfis6rtxaii	clodts23r000jlyfiiw7iwtpm	we are working in this company	ما در این شرکت کار می‌کنیم	2023-10-31 04:25:27.992
clodttm0x000nlyfichdgy8b9	clodts23r000jlyfiiw7iwtpm	no smoking is company policy	سیگار نکشیدن قانون شرکت است	2023-10-31 04:26:12.801
clodtuwru000qlyfi1ua3xz60	clodtujfy000olyfibaimauxi	this system works fine	این سیستم به خوبی کار می‌کند	2023-10-31 04:27:13.387
clodtwd8s000slyfiknb41e7f	clodtujfy000olyfibaimauxi	this hotel has a great heating system	این هتل یک سیستم گرمایشی عالی دارد	2023-10-31 04:28:21.389
clodtxhyq000vlyfio9vdh5wo	clodtwryp000tlyfij8qjn2h1	brush your teeth after each meal	بعد از هر وعده غذایی دندان‌هایتان را مسواک بزنید	2023-10-31 04:29:14.162
clodty6qd000xlyfixiq33xwj	clodtwryp000tlyfij8qjn2h1	I'm thinking of you, each moment	من به تو فکر می‌کنم هر لحظه	2023-10-31 04:29:46.262
clodtz3610010lyficpmes2i8	clodtyn7t000ylyfipj40e9il	I think you are right	من فکر می‌کنم حق با شماست	2023-10-31 04:30:28.297
clodu3zic0014lyfidw794o74	clodtyn7t000ylyfipj40e9il	lie on your right side	سمت راستتان دراز بکشید	2023-10-31 04:34:16.836
clodu5bwf0017lyfip3s8y50c	clodu4aeo0015lyfi370tvzj5	this TV programme is interesting	این برنامه تلویزیونی جالب است	2023-10-31 04:35:19.551
clodu5slr0019lyfiqgnccro7	clodu4aeo0015lyfi370tvzj5	what is your favourite program?	برنامه مورد علاقه تو چیست	2023-10-31 04:35:41.2
clodu7cdq001clyfi21m93qaj	clodu6ntz001alyfix7r8erpg	do you hear me?	آیا صدای مرا می‌شنوی	2023-10-31 04:36:53.487
clodu7tbj001elyfinj1893q2	clodu6ntz001alyfix7r8erpg	do you hear something?	آیا صدای می‌شنوی	2023-10-31 04:37:15.44
clodu8ecf001hlyfic0p5i0ky	clodu8323001flyfi1q4md6mq	may I ask you a question?	آیا ممکن است یک سوال بپرسم	2023-10-31 04:37:42.688
clodu8r1b001jlyfint7sc5az	clodu8323001flyfi1q4md6mq	do you have a question?	آیا تو سوالی داری	2023-10-31 04:37:59.135
clodub5h4001mlyfirocg4hzp	clodu974b001klyfigo5e354u	be careful during the trip	در طول سفر مراقب باش	2023-10-31 04:39:51.161
cloduci7a001olyfijoqkv9hl	clodu974b001klyfigo5e354u	you're not allowed to talk during the exam	شما اجازه ندارید در طول امتحان صحبت کنید	2023-10-31 04:40:54.311
clodud0op001rlyfiws84c427	cloducr5h001plyfiwmq2dnj7	let's play football	بیا فوتبال بازی کنیم	2023-10-31 04:41:18.265
clodudj5e001tlyfivl9grrmi	cloducr5h001plyfiwmq2dnj7	I play golf every other day	من یک روز در میان گلف بازی می‌کنم	2023-10-31 04:41:42.194
cloduehpu001wlyfiyvhuvm6a	clodue15l001ulyfijpb55sgy	Peter works for government	پیتر برای دولت کار می‌کند	2023-10-31 04:42:26.994
cloduf9fo001ylyfiugsblkey	clodue15l001ulyfijpb55sgy	the two governments sign an arguments	دو دولت یک توافقنامه امضا کردند	2023-10-31 04:43:02.916
clodug90g0021lyfim7a33fy1	clodufo1i001zlyfilhxydq0d	thanks God, we are able to run	خدا را سپاس ما قادریم بدویم	2023-10-31 04:43:49.025
clodugsw60023lyfi1eqv035y	clodufo1i001zlyfilhxydq0d	we are running for the bus	ما برای رسیدن به اتوبوس می‌دویم	2023-10-31 04:44:14.791
clodul2e30026lyfizou145cc	clodukcgo0024lyfiymjrkvke	this shirt is too small for me	این پیراهن برای من خیلی کوچک است	2023-10-31 04:47:33.724
clodulzj20028lyfii7m9588i	clodukcgo0024lyfiymjrkvke	can you see that the small house?	آیا می‌توانی خانه کوچک را ببینی	2023-10-31 04:48:16.67
clodumwys002blyfixicu4wjc	clodumesp0029lyfigog6cg9h	I forgot your phone number	من شماره تلفنت را فراموش کردم	2023-10-31 04:49:00.005
clodunifd002dlyfiic41pn4p	clodumesp0029lyfigog6cg9h	what number bus do I take?	اتوبوس شماره چند را باید سوار شوم	2023-10-31 04:49:27.817
cloduo6hj002glyfiec3p09lw	clodunsxu002elyfihzxfrepn	there's always a next time	همیشه دفعه بعدی وجود دارد	2023-10-31 04:49:58.999
cloduoiby002ilyfig1thgfhf	clodunsxu002elyfihzxfrepn	you can always Count On Me	تو می‌تونی همیشه روی من حساب کنی	2023-10-31 04:50:14.35
cloduqiea002llyfigh2uqhk9	cloduptks002jlyfi2iqll453	please move your car out of here	لطفاً ماشینت را به بیرون از اینجا جابجا کن	2023-10-31 04:51:47.746
clodur23h002nlyfixtgiv8qf	cloduptks002jlyfi2iqll453	it's too cold, I can't move my fingers	خیلی سرد است من نمی‌توانم انگشتانم را حرکت دهم	2023-10-31 04:52:13.278
cloduru33002qlyfiymwo36bb	clodurl77002olyfibbswbxgv	have a nice night	شب خوبی داشته باشید	2023-10-31 04:52:49.552
clodushpo002slyfi7qf189lg	clodurl77002olyfibbswbxgv	we stayed up all night	ما کل شب را بیدار ماندیم	2023-10-31 04:53:20.172
clodutki3002vlyfiad0wk722	clodut9ur002tlyfiho61tyua	where do you live?	کجا زندگی می‌کنی	2023-10-31 04:54:10.443
cloduu4rm002xlyfiz15tl740	clodut9ur002tlyfiho61tyua	we live in the city	ما در این شهر زندگی می‌کنیم	2023-10-31 04:54:36.706
cloduwc2w0030lyfi5h0ko3cp	cloduvhx1002ylyfi9am7tvsg	I agree with you on this point	من در این نقطه نظر با تو موافقم	2023-10-31 04:56:19.497
cloduwrqz0032lyfi93iezmxd	cloduvhx1002ylyfi9am7tvsg	yes I can see your point	بله من می‌توانم نقطه نظر شما را درک کنم	2023-10-31 04:56:39.803
cloduxqtk0035lyfi6dpiqq03	cloduxccd0033lyfi724b6pkt	believe in yourself	خودت را باور داشته باش	2023-10-31 04:57:25.257
cloduydrs0037lyfibb092vd5	cloduxccd0033lyfi724b6pkt	do you believe me?	آیا مرا باور می‌کنی	2023-10-31 04:57:55.001
clodv079s003alyfibffbwnxy	cloduzd7q0038lyfilvmruzg2	take a breath and hold it	یک نفس بکشید و آن را نگه دارید	2023-10-31 04:59:19.889
clodv15lp003clyfi6cx6198s	cloduzd7q0038lyfilvmruzg2	would you please hold my hand?	آیا ممکن است دستم را نگه داری	2023-10-31 05:00:04.382
clodv1vjg003flyfiay8b6whj	clodv1kqt003dlyfibmd0z2hz	today is my birthday	امروز روز تولد من است	2023-10-31 05:00:37.997
clodv275u003hlyfi4bjxipqw	clodv1kqt003dlyfibmd0z2hz	I'm free today	امروز آزاد هستم	2023-10-31 05:00:53.058
clodv2xcu003klyfismxtzp0d	clodv2jkq003ilyfi9xkcajvk	this shirt is too large	این پیراهن خیلی بزرگ است	2023-10-31 05:01:27.006
clodv3902003mlyfi8axohzbc	clodv2jkq003ilyfi9xkcajvk	Asia is very large	آسیا خیلی وسیع است	2023-10-31 05:01:42.098
clodv5pf1003rlyfibbljo2y1	clodv3gre003nlyfi1p6sc92x	there are millions of people around the City	میلیون‌ها نفر از مردم دور و بر این شهر هستند	2023-10-31 05:03:36.686
clodv4603003plyfisb4o033i	clodv3gre003nlyfi1p6sc92x	that house costs about 2 million dollars	آن خانه حدود ۲ میلیون دلار هزینه دارد	2023-10-31 05:02:24.867
clodv7n61003ulyfiwee3zkml	clodv7bqz003slyfiiezt3wle	you must go now	تو باید الان بری	2023-10-31 05:05:07.081
clodv7wmb003wlyfi3dmsbp2v	clodv7bqz003slyfiiezt3wle	we must learn English language	ما باید زبان انگلیسی را یاد بگیریم	2023-10-31 05:05:19.332
clodv8per003zlyfi3p0pr0f8	clodv8akg003xlyfietsn2k1w	welcome to our home	به خانه ما خوش آمدید	2023-10-31 05:05:56.643
clodv9bow0041lyfihtascxr5	clodv8akg003xlyfietsn2k1w	it's better to go home now	بهتر است الان به خانه برویم	2023-10-31 05:06:25.52
clodvas7x0044lyfin8xrl9gs	clodv9vt70042lyfismj93aey	a cookie is under the table	یک کلوچه زیر میز است	2023-10-31 05:07:33.597
clodvc2dr0046lyfimdi6415y	clodv9vt70042lyfismj93aey	all items are under a dollor	همه موارد زیر یک دلار هستند	2023-10-31 05:08:33.424
clodve9zw0049lyfi0bbl4y7n	clodvd6oz0047lyfijuhfqdj2	oil will float on water	روغن روی آب شناور می‌ماند	2023-10-31 05:10:16.605
clodversr004blyfitkcbeyb9	clodvd6oz0047lyfijuhfqdj2	this glass contains water	این لیوان آب در بر دارد	2023-10-31 05:10:39.675
clodvgxn3004elyfim5fba6u5	clodvfcjp004clyfig0yfns9n	where is room 115?	اتاق شماره ۱۱۵ کجاست	2023-10-31 05:12:20.559
clodvi03f004glyfiz9ob8xno	clodvfcjp004clyfig0yfns9n	someone entered the room	فردی وارد اتاق شد	2023-10-31 05:13:10.396
clofe87450002ly7zkxindp56	clofe7pjl0000ly7z6l1sizxa	write your name and address in full	اسم و آدرستان را به صورت کامل بنویسید	2023-11-01 06:45:11.814
clofe8oyb0004ly7zuh9ijp74	clofe7pjl0000ly7z6l1sizxa	Julie write for a magazine	جولی برای یک مجله می‌نویسد	2023-11-01 06:45:34.931
clofe96290007ly7zhb6c1uqf	clofe8web0005ly7z486djwle	my mother can't come	مادرم نمی‌تواند بیاید	2023-11-01 06:45:57.105
clofe9lxr0009ly7zxec5m955	clofe8web0005ly7z486djwle	you remind me of my mother	تو مرا به یاد مادرم می‌اندازی	2023-11-01 06:46:17.68
clofealha000cly7zxdzntly6	clofe9yxk000aly7zvrg8ya6z	this area is quiet now	این منطقه الان ساکت است	2023-11-01 06:47:03.742
clofeb4tb000ely7z0drxlgkw	clofe9yxk000aly7zvrg8ya6z	software is my area of expertise	نرم‌افزار حیطه تخصص من است	2023-11-01 06:47:28.799
clofec2ft000hly7zll67tado	clofebgmn000fly7zbw24w897	Jackson become a national hero	جکسون قهرمان ملی شد	2023-11-01 06:48:12.377
clofecv6k000jly7zcbbjsv1r	clofebgmn000fly7zbw24w897	hunting is not allowed in National Parks	شکار در پارک‌های ملی ممنوع است	2023-11-01 06:48:49.628
clofedkcp000mly7zmqvp58be	clofed98s000kly7zxcjb6jrw	do you want some money?	آیا مقدار پول می‌خواهی	2023-11-01 06:49:22.249
clofee1xm000oly7zesc02stu	clofed98s000kly7zxcjb6jrw	don't waste your money	پولت را هدر نده	2023-11-01 06:49:45.034
clofeftqj000rly7zjmpkwyuc	clofeff9p000ply7zbnt5ft1z	what is the story?	جریان چیست	2023-11-01 06:51:07.723
clofegfhb000tly7ztv0gpw6g	clofeff9p000ply7zbnt5ft1z	I don't think Emma's the story is true	من فکر نمی‌کنم جریان اما درست باشد	2023-11-01 06:51:35.904
clofehgoq000wly7zgyh8gt7r	clofegq8v000uly7zblesxi7n	you are always young enough to learn	تو همیشه به اندازه‌ای جوانی که یاد بگیری	2023-11-01 06:52:24.123
clofei097000yly7zxroerj9z	clofegq8v000uly7zblesxi7n	young people like pop music	افراد جوان موزیک پاپ دوست دارند	2023-11-01 06:52:49.484
clofejnc30011ly7zfotuzojj	clofeikpq000zly7z50szwxoo	that fact cannot be denied	آن حقیقت نمی‌تواند نادیده گرفته شود	2023-11-01 06:54:06.051
clofekj670013ly7zf4blroei	clofeikpq000zly7z50szwxoo	this story was based on fact	این داستان بر اساس واقعیت بود	2023-11-01 06:54:47.312
clofelt1j0016ly7zxghjt6e2	clofel4hh0014ly7z98d3zc16	you have two months to finish the job	دو ماه برای تمام کردن کار از فرصت داری	2023-11-01 06:55:46.76
clofemayx0018ly7zqsxqa8vh	clofel4hh0014ly7z98d3zc16	we will be in Canada next month	ما ماه آینده در کانادا خواهیم بود	2023-11-01 06:56:09.993
clofenwe9001bly7z1d6icjbp	clofempbt0019ly7z61yqdsg5	Emily's entirely different from her family	امیلی به کلی با خانواده‌اش متفاوت است	2023-11-01 06:57:24.417
clofeofgv001dly7zh3jie022	clofempbt0019ly7z61yqdsg5	my camera is different from yours	دوربین من متفاوت از دوربین شما است	2023-11-01 06:57:49.136
clofepmg9001gly7zf6knnkwo	clofep05b001ely7zj7n0samz	there are a lot of people in the park	خیلی از افراد در جشن بودند	2023-11-01 06:58:44.841
clofeq6bt001ily7zcjaub4am	clofep05b001ely7zj7n0samz	we can go to the parking lot	ما می‌توانیم به قسمت پارکینگ برویم	2023-11-01 06:59:10.602
cloferqg6001lly7zxckuh12o	clofer0xj001jly7zwkb1krvx	you can study here	تو میتوانی اینجا درس بخوانی	2023-11-01 07:00:23.335
clofes2jl001nly7z1bwdd6u8	clofer0xj001jly7zwkb1krvx	when do you study?	چه موقع تو درس می‌خوانی	2023-11-01 07:00:39.01
clofesvhk001qly7z69j4l6rq	clofesj9b001oly7zu0emq8fi	where is my book?	کتاب من کجاست	2023-11-01 07:01:16.521
clofetflj001sly7zs6sepb9n	clofesj9b001oly7zu0emq8fi	I want to book a room in your hotel	من می‌خواهم اتاقی در هتل شما رزرو کنم	2023-11-01 07:01:42.583
clofeuytf001vly7zpmysrlyf	clofeuk6c001tly7zv5511eaz	Emma has brown eyes	اما چشم‌های قهوه‌ای دارد	2023-11-01 07:02:54.148
clofevcto001xly7zl8vtd64f	clofeuk6c001tly7zv5511eaz	close your eyes and take a rest	چشمانت را ببند و استراحت کن	2023-11-01 07:03:12.301
clofewmu00020ly7zqur5445p	clofevou1001yly7z8n6jb982	did you finish the job?	آیا کار را تمام کردی	2023-11-01 07:04:11.928
clofex06w0022ly7zv7gh3ram	clofevou1001yly7z8n6jb982	how do you like your new job?	چقدر کار جدیدت را دوست داری	2023-11-01 07:04:29.241
clofey2dt0025ly7zqh65gtly	clofexn530023ly7zog9afoic	what does this word mean?	این کلمه چه معنی دارد	2023-11-01 07:05:18.738
clofeypjp0027ly7zut99vnkl	clofexn530023ly7zog9afoic	can I have a word with you?	آیا می‌توانم با شما حرفی داشته باشم	2023-11-01 07:05:48.757
cloff08ge002aly7z69wwcyhh	clofezqll0028ly7z1l0n38wh	thanks though	ممنون به هر حال	2023-11-01 07:06:59.918
cloff1ucp002cly7z6yawdzap	clofezqll0028ly7z1l0n38wh	we haven't seen Mori for years, though	ما موری را سال‌هاست که ندیده‌ایم به هر حال	2023-11-01 07:08:14.954
cloff2sh6002fly7z2inu72d1	cloff2cop002dly7zvjt7b6r9	what business are you in?	شما در چه حرفه‌ای هستید	2023-11-01 07:08:59.178
cloff3fg7002hly7zytk2hogq	cloff2cop002dly7zvjt7b6r9	how is your business?	بیزینس شما چطور است	2023-11-01 07:09:28.951
cloff4lgr002kly7z2kjljaz3	cloff3tzd002ily7zw1z7bz03	pollution is a major issue nowadays	امروزه آلودگی هوا یک مسئله اصلی است	2023-11-01 07:10:23.404
cloff52rj002mly7zmd4yujlh	cloff3tzd002ily7zw1z7bz03	how do you feel about this issue?	چه حسی نسبت به مسئله دارید	2023-11-01 07:10:45.824
cloff5zzz002ply7zv373k26v	cloff5i55002nly7zsw2473ug	park your car on the other side	ماشینت را آن طرف پارک کنید	2023-11-01 07:11:28.895
cloff6m8z002rly7z44fgdpaz	cloff5i55002nly7zsw2473ug	problem is this side on the wall	مشکل این طرف دیوار است	2023-11-01 07:11:57.731
cloffif17002uly7zd64nttcn	cloffhxl2002sly7zi89qbgou	you are so kind, this is kind of you	شما بسیار مهربانید این از مهربانی شماست	2023-11-01 07:21:08.252
cloffiqvb002wly7zd8yxfc50	cloffhxl2002sly7zi89qbgou	what kind of car do you drive?	چه نوع ماشینی سوار می‌شوی	2023-11-01 07:21:23.591
cloffk2hb002zly7zpbcxx2k9	cloffjfx9002xly7z543t4z7x	a square has four sides	یک مربع چهار ضلع دارد	2023-11-01 07:22:25.296
cloffkk1o0031ly7zsdz6y1cp	cloffjfx9002xly7z543t4z7x	let's meet at 4:00	بیا ساعت ۴ دیدار کنیم	2023-11-01 07:22:48.06
cloffm72r0034ly7z67mwzwbp	cloffkyeq0032ly7zrvp1c5ap	put this song on to keep your head warm	این کلاه را بگذار که سرت را گرم نگه داری	2023-11-01 07:24:04.564
cloffmphh0036ly7zpyq1zcbh	cloffkyeq0032ly7zrvp1c5ap	can I speak to the Head Nurse?	آیا می‌توانم با سرپرستار صحبت کنم	2023-11-01 07:24:28.421
cloffnv5k0039ly7zdi0lqgk0	cloffngg70037ly7z3da1p2bt	we are far from home now	ما الان از خانه خیلی دوریم	2023-11-01 07:25:22.424
cloffosbp003bly7znizxy149	cloffngg70037ly7z3da1p2bt	it's not for, it's near	آن خیلی دور نیست, نزدیک است	2023-11-01 07:26:05.413
cloffphif003ely7z3xunz6ve	cloffp2dk003cly7z2plw6nvd	do you like black cats?	آیا گربه‌های سیاه را دوست داری	2023-11-01 07:26:38.055
cloffpx5t003gly7zzreja8fv	cloffp2dk003cly7z2plw6nvd	I would like a black coffee please	معنی قهوه سیاه می‌خواهم لطفاً	2023-11-01 07:26:58.337
cloffqx9h003jly7zqilnbe19	cloffqc7t003hly7zssx5hjrs	it has a long story	آن یک داستان طولانی دارد	2023-11-01 07:27:45.125
cloffrf0k003lly7z4xqb0c8q	cloffqc7t003hly7zssx5hjrs	how long does it take?	آن چقدر طول می‌کشد	2023-11-01 07:28:08.132
cloffsc21003oly7z1oggwmpr	cloffrx5r003mly7zv11wckcx	both of you stop it	هر دوی شما تمامش کنید	2023-11-01 07:28:50.953
clofftjcn003qly7zrgt2uec9	cloffrx5r003mly7zv11wckcx	both of us were going to the party	هر دوی ما داشتیم به پارتی می‌رفتیم	2023-11-01 07:29:47.063
cloffuv67003tly7zr7nx2chu	cloffu5hb003rly7zfr6lv42x	please give me just a little	لطفاً به من فقط یکمی بدهید	2023-11-01 07:30:49.04
cloffvhbl003vly7zx7duzebl	cloffu5hb003rly7zfr6lv42x	a little bird told me	یه پرنده کوچک به من گفت	2023-11-01 07:31:17.746
cloffw7dy003yly7z0kkldsr4	cloffvqyp003wly7z5j4udw1h	I'm looking for a house	من دارم دنبال یه خانه میگردم	2023-11-01 07:31:51.527
cloffxjw80040ly7zqj8yh7vf	cloffvqyp003wly7z5j4udw1h	come to my house at night	شب به خانه من بیا	2023-11-01 07:32:54.393
cloffyku50043ly7z6zco2hh2	cloffxwz60041ly7zgg6qg38n	we live here since 2009	ما از سال ۲۰۰۹ اینجا زندگی کردیم	2023-11-01 07:33:42.269
cloffzmp30045ly7z79u2in9n	cloffxwz60041ly7zgg6qg38n	since you have asked I will tell you	از آنجا که پرسیدی من به تو خواهم گفت	2023-11-01 07:34:31.335
clofg0law0048ly7zeclp4jel	cloffzx0r0046ly7zt9zr49a4	all meals are provided by mom	همه غذاها توسط مامان تهیه شدند	2023-11-01 07:35:16.185
clofg15zz004aly7zjyk01n7g	cloffzx0r0046ly7zt9zr49a4	we will provide all the things you need	ما همه چیزهایی که نیاز داریم را تدارک خواهیم دید	2023-11-01 07:35:43.008
clofg2ann004dly7za1o4b47b	clofg1trp004bly7zlkadd484	there is a limited bus service	سرویس اتوبوس محدود شده وجود دارد	2023-11-01 07:36:35.7
clofg307y004fly7zmm4cmdgv	clofg1trp004bly7zlkadd484	We complained about the pool service	ما درباره سرویس ضعیف شکایت کردیم	2023-11-01 07:37:08.831
clofg6jos004jly7zsun4i3m0	clo6rjb220002lyi6gan1si63	turn off the alarm clock	ساعت هشدار رو خاموش کن	2023-11-01 07:39:54.028
clofg738s004lly7zyc6e3l98	clo6rkghh0005lyi6u8thll6d	be a good boy from now on	از این به بعد پسر خوبی باش	2023-11-01 07:40:19.373
clofsqqln004qly7zt1eh6zwj	clofspldf004oly7zvxwe699x	I want to travel around the world	من می‌خواهم به دور دنیا سفر کنم	2023-11-01 13:31:31.499
clofsqzgj004sly7z80kchw4o	clofspldf004oly7zvxwe699x	see you around	همین دور و بر میبینمت	2023-11-01 13:31:42.98
clofsuh5l004vly7z30ef6028	clofsr8s7004tly7ze3a50b01	this is my friend Bob	این دوست من باب است	2023-11-01 13:34:25.881
clofsurww004xly7zxpuhrl3p	clofsr8s7004tly7ze3a50b01	I have some friends in Canada	من دوستانی در کانادا دارم	2023-11-01 13:34:39.825
clofsvpvc0050ly7z220c5or0	clofsvdf0004yly7zcohn62s1	this is an important issue	این یک مسئله مهم است	2023-11-01 13:35:23.833
clofsw2ph0052ly7zjwzj65ky	clofsvdf0004yly7zcohn62s1	it's not important for me	آن برای من مهم نیست	2023-11-01 13:35:40.469
clofswph60055ly7zomsjf6hm	clofswgnj0053ly7zqb5uh9hq	my father is a doctor	پدر من یک دکتر است	2023-11-01 13:36:09.978
clofsxfg80057ly7z7vs8xvad	clofswgnj0053ly7zqb5uh9hq	say hello to your father	به پدرت سلام کن	2023-11-01 13:36:43.641
cloft7ul1005aly7ze1cdzro5	cloft79vx0058ly7zwctd969o	may I sit next to you?	آیا ممکن از کنار شما بنشینم	2023-11-01 13:44:49.814
cloft88z3005cly7zrerwgoam	cloft79vx0058ly7zwctd969o	sit wherever you like	هرجایی که دوست داری بشین	2023-11-01 13:45:08.464
cloft9fz5005fly7zw9hu4uyh	cloft8y2g005dly7zpi9u760e	go away	دور شو (گمشو)	2023-11-01 13:46:04.193
cloft9u0g005hly7zdscknqim	cloft8y2g005dly7zpi9u760e	keep away from the fire	از آتش دور بمان	2023-11-01 13:46:22.384
cloftav9k005kly7zm179sf0s	cloftak0p005ily7zhovc3xlo	I have to work until 5	من باید تا ساعت ۵ کار کنم	2023-11-01 13:47:10.665
cloftbg4i005mly7z5tyibd9m	cloftak0p005ily7zhovc3xlo	wait until further notice	تا اطلاع بعدی منتظر باش	2023-11-01 13:47:37.699
cloftckmb005ply7zpj6qwsul	cloftc00q005nly7zbgui8pvt	I have the power to control my life	من قدرت را دارم که زندگیم را کنترل کنم	2023-11-01 13:48:30.18
cloftdat8005rly7zhol2yyi9	cloftc00q005nly7zbgui8pvt	this car doesn't have enough power to carry us	این ماشین قدرت کافی برای حمل ما را ندارد	2023-11-01 13:49:04.125
clofti7ks005uly7z4gqcqwav	cloftgap9005sly7zjacbjzke	it will take 5 hours	آن ۵ ساعت طول خواهد کشید	2023-11-01 13:52:53.212
cloftiob6005wly7zoe7y6ec4	cloftgap9005sly7zjacbjzke	we studied for 1 hour	ما یک ساعت مطالعه کردیم	2023-11-01 13:53:14.898
cloftodzc005zly7z8vx62gzn	cloftnp0q005xly7zks69f8sw	life is a game be a good player	زندگی یک بازی است بازیکن خوبی باش	2023-11-01 13:57:41.448
cloftos8w0061ly7z82vyt9nf	cloftnp0q005xly7zks69f8sw	now let's begin the game	حالا بیایید بازی را شروع کنیم	2023-11-01 13:57:59.937
cloftpzd80064ly7z1kpqwhz3	cloftpb470062ly7zzf6wq4jy	I often work until night	من اغلب تا شب کار می‌کنم	2023-11-01 13:58:55.82
cloftqfjl0066ly7zbg50xgb2	cloftpb470062ly7zzf6wq4jy	how often do you eat out?	هر چند وقت یکبار بیرون غذا میخوری	2023-11-01 13:59:16.785
cloftrnpl0069ly7zij78i5lb	cloftr8670067ly7z11533dkj	I don't know yet	من هنوز نمی‌دانم	2023-11-01 14:00:14.025
cloftumg8006bly7z7lns3qyd	cloftr8670067ly7z11533dkj	I'm not ready yet	من هنوز آماده نیستم	2023-11-01 14:02:32.361
cloftvhin006ely7z7puamwou	cloftv48q006cly7ze9c34zb8	wait in line please	لطفاً در صف منتظر بمانید	2023-11-01 14:03:12.623
cloftxcj3006gly7z4l7pik6y	cloftv48q006cly7ze9c34zb8	I want to draw a straight line	من می‌خواهم این خط مستقیم بکشم	2023-11-01 14:04:39.472
cloftyamp006jly7zu1sts556	cloftxt8t006hly7zyoik5o2p	that man is a political leader	آن مرد یک رهبر سیاسی است	2023-11-01 14:05:23.665
cloftzv4k006lly7zzqzpyu33	cloftxt8t006hly7zyoik5o2p	this is a political decision	این یک تصمیم سیاسی است	2023-11-01 14:06:36.884
clofu3nac006oly7z1n4kt9en	clofu1avn006mly7z19zxkzku	this is the end of the story	این پایان داستان است	2023-11-01 14:09:33.349
clofu6lp0006qly7zghnwaetd	clofu1avn006mly7z19zxkzku	go straight to the end of that street	مستقیم به انتهای آن خیابان بروید	2023-11-01 14:11:51.252
clofu8dsu006tly7zj7lwp2ir	clofu7cxq006rly7zlsqqavpq	mom divided the bread amoung the kids	مامان نام را بین بچه‌ها تقسیم کرد	2023-11-01 14:13:14.334
clofuavxy006vly7z8ljallaw	clofu7cxq006rly7zlsqqavpq	we agreed among ourselves	ما در میان خودمان توافق کردیم	2023-11-01 14:15:11.159
clofubp5u006yly7zcxf1v5ju	clofub7f4006wly7zefy1bbe6	have you ever been to London?	آیا تا به حال در لندن بوده‌اید	2023-11-01 14:15:49.026
clofuc67d0070ly7zs905jgqh	clofub7f4006wly7zefy1bbe6	the smell is worse than ever	بو بدتر از همیشه است	2023-11-01 14:16:11.113
clofud5a80073ly7zikxn0jyj	clofucij00071ly7zq2b7fjq3	stand here and wait for me	اینجا بایست تا منتظر من بمان	2023-11-01 14:16:56.576
clofudmh30075ly7z0gqsghvp	clofucij00071ly7zq2b7fjq3	I'm just standing here	من فقط اینجا ایستاده‌ام	2023-11-01 14:17:18.855
clofuf2dx0078ly7zkrae0s2c	clofue4h80076ly7zr9rq9xq3	that was a bad news for everyone	آن خبر بدی برای همه بود	2023-11-01 14:18:26.134
clofufmi3007aly7zvy3o0fuu	clofue4h80076ly7zr9rq9xq3	stay at home the weather is bad now	در خانه بمان هوا الان بد است	2023-11-01 14:18:52.204
clofugooa007dly7zb6hk0c8a	clofug35v007bly7zc80l0p86	I don't want to lose this opportunity	من نمی‌خوام این فرصت را از دست بدهم	2023-11-01 14:19:41.674
clofugytf007fly7zzwgg1e21	clofug35v007bly7zc80l0p86	I'm trying to lose weight	من دارم سعی می‌کنم وزنم را کم کنم	2023-11-01 14:19:54.819
clofupnqz007ily7zbqzrgx4z	clofun459007gly7zc72toewh	however we loved our Grandpa	به هر حال ما پدربزرگمان را دوست داشتیم	2023-11-01 14:26:40.38
clofuqc20007kly7zf58nnutx	clofun459007gly7zc72toewh	we will cook your food however you like it	ما غذایتان را به هر صورت که دوست داشته باشید خواهیم پخت	2023-11-01 14:27:11.88
clofur4fv007nly7zhvpoorjg	clofuqlim007lly7zamut8j6w	we are members of this team	ما اعضای این تیم هستیم	2023-11-01 14:27:48.667
clofurrag007ply7zirn1u0i5	clofuqlim007lly7zamut8j6w	the lion is a member of the cat family	شیر یک عضو از خانواده گربه‌ها است	2023-11-01 14:28:18.281
clofusbvq007sly7zg7ll8qvy	clofurzpt007qly7zc6ddz13b	can I pay in cash?	آیا من می‌توانم به صورت نقدی پرداخت کنم	2023-11-01 14:28:44.966
clofut22w007uly7z7nq0wmly	clofurzpt007qly7zc6ddz13b	you should pay your debt immediately	شما باید قرضتان را فوراً پرداخت کنید	2023-11-01 14:29:18.92
clofuupgs007xly7zogivd474	clofuucb6007vly7zlpp4dvb0	don't be upset this is natural law	ناراحت نباش این یک قانون طبیعی است	2023-11-01 14:30:35.885
clofuvmmi007zly7zxaiol5c2	clofuucb6007vly7zlpp4dvb0	that law was changed last year	آن قانون سال گذشته تغییر داده شد	2023-11-01 14:31:18.858
clofuwpj00082ly7z7g0gm95t	clofuvxs90080ly7zjytdauhn	let's meet again on Sunday	بیا یکشنبه دوباره دیدار کنیم	2023-11-01 14:32:09.276
clofuwzq10084ly7zzb7fskbu	clofuvxs90080ly7zjytdauhn	pleased to meet you	از ملاقات با شما خرسندم	2023-11-01 14:32:22.489
clofuxsbk0087ly7z2moh7nlv	clofux9si0085ly7z88zkx6hs	put that box in the car	آن جعبه را داخل ماشین قرار بده	2023-11-01 14:32:59.553
clofuy63q0089ly7zel1f4g80	clofux9si0085ly7z88zkx6hs	which one is your car?	کدام یک ماشین توست	2023-11-01 14:33:17.414
clofuz6ny008cly7zil1m7eac	clofuyl56008aly7z3xsihz38	I was born in the city in 2002	من سال ۲۰۰۲ در این شهر به دنیا آمدم	2023-11-01 14:34:04.798
clofuzvz8008ely7zwxcszjdg	clofuyl56008aly7z3xsihz38	which city do you like the best?	کدام شهر را بیشتر از همه دوست داری	2023-11-01 14:34:37.604
clofv0e5b008hly7zz7f9iv1k	clofv050m008fly7zvw16joo1	I'm almost done	من تقریبا کارم تمام است	2023-11-01 14:35:01.151
clofv0o4q008jly7zrgvhajds	clofv050m008fly7zvw16joo1	dinner is almost ready	شام تقریباً آماده است	2023-11-01 14:35:14.09
clofv1u3d008mly7z4ethsx85	clofv102v008kly7zrrycgld3	the hotel room charge includes breakfast	هزینه اتاق هتل شامل صبحانه می‌شود	2023-11-01 14:36:08.473
clofv2dik008oly7zt4psgmpk	clofv102v008kly7zrrycgld3	does that price include tax?	آیا آن مبلغ شامل مالیات می‌شود	2023-11-01 14:36:33.645
clofv36oo008rly7z4y163h3n	clofv2mp3008ply7z6iffiuy7	just continue learning never stop	فرق یادگیری ادامه بده, هرگز متوقف نشو	2023-11-01 14:37:11.448
clofv3ods008tly7zxex46bwi	clofv2mp3008ply7z6iffiuy7	please continue we are listening	لطفاً ادامه بده ما گوش می‌دهیم	2023-11-01 14:37:34.385
clogp9ipv0002lyivrnihdr3i	clogp82eh0000lyivzz0sa6ym	Jack sets the alarm clock for 7:00 a.m.	جنگ ساعت هشدار را برای ۷ صبح تنظیم کرد	2023-11-02 04:41:55.459
clogp9w1d0004lyiv479rpbrt	clogp82eh0000lyivzz0sa6ym	thank you for setting the table	از شما برای چیدن میز ممنونم	2023-11-02 04:42:12.721
clogpayab0007lyivf9b2hoj7	clogpacw90005lyiv55aoh9o2	I will talk to you later if you don't mind	اگر از نظر شما مشکلی نیست بعداً با شما صحبت خواهم کرد	2023-11-02 04:43:02.291
clogpbmgv0009lyiv8ic3z8ce	clogpacw90005lyiv55aoh9o2	could you call again later please?	آیا ممکن است شما بعد از زنگ بزنید	2023-11-02 04:43:33.631
clogpcv9l000clyivw7ko6xoi	clogpbzop000alyivm7c79kgr	Joe is well known in the local community	جو در انجمن محلی به خوبی شناخته شده است	2023-11-02 04:44:31.689
clogpdpjk000elyivqrww9d6n	clogpbzop000alyivm7c79kgr	we are here to help the community to grow	ما اینجاییم تا کمک کنیم که جامعه رشد کند	2023-11-02 04:45:10.928
clogpemwi000hlyiv9nhohcya	clogpe1vt000flyivcl58lqdk	may I have your name?	آیا ممکن است اسم شما را بدانم	2023-11-02 04:45:54.162
clogpewfh000jlyiv5e268nxb	clogpe1vt000flyivcl58lqdk	write down your name here	اسمتان را اینجا بنویسید	2023-11-02 04:46:06.51
clogpg57y000mlyiv8q2k3hqw	clogpffsx000klyivjq4l8gv4	it cost only five dollors	آن تنها ۵ دلار هزینه دارد	2023-11-02 04:47:04.558
clogpgkav000olyiv81que45d	clogpffsx000klyivjq4l8gv4	wake me up at 5:00 please	لطفاً مرا ساعت ۵ بیدار کنید	2023-11-02 04:47:24.104
clogphajv000rlyiv3j3v3sti	clogpgv5s000plyivwma72shv	would you say it once more?	آیا می‌شود یک بار دیگر آن را بگویید	2023-11-02 04:47:58.123
clogphuco000tlyiv6dampdtg	clogpgv5s000plyivwma72shv	for once the bus come on time	برای اولین بار اتوبوس سر موقع آمد	2023-11-02 04:48:23.784
clogpihwz000wlyivzc6nn3o4	clogpi1vp000ulyiv5os4k9ri	would you like white wine or red?	آیا شراب سفید می‌خواهید یا قرمز	2023-11-02 04:48:54.323
clogpiz7d000ylyiv27tfisbq	clogpi1vp000ulyiv5os4k9ri	today you should wear a white shirt	شما امروز باید پیراهن سفید بپوشید	2023-11-02 04:49:16.73
clogpl6qt0011lyivnolra21i	clogpkaa0000zlyivrn9avkl9	that is the answer I least wanted to hear	آن پاسخی است که من کمتر از همه می‌خواستم بشنوم	2023-11-02 04:50:59.814
clogpmcgr0013lyivbimg4gg6	clogpkaa0000zlyivrn9avkl9	which of these shirts cost least?	کدام یک از این پیراهن‌ها کمترین قیمت را دارد	2023-11-02 04:51:53.883
clogpn4s00016lyivs6l8rp9e	clogpmntb0014lyivqpy38nh0	now let's listen to Mr President	اکنون اجازه دهید به سخنان آقای رئیس جمهور گوش دهیم	2023-11-02 04:52:30.576
clogpnibd0018lyiv5tkis4uj	clogpmntb0014lyivqpy38nh0	Emily is a friend of the president of the bank	امیلی دوست رئیس بانک است	2023-11-02 04:52:48.121
clogpo61r001blyivjlg6cr94	clogpns9z0019lyiv1qatweyk	everyone wants to learn English	همه می‌خواهند انگلیسی یاد بگیرند	2023-11-02 04:53:18.88
clogpoj3q001dlyivll0zr08u	clogpns9z0019lyiv1qatweyk	no one is too old to learn	هیچکس برای یادگیری پیر نیست	2023-11-02 04:53:35.798
cloh3bdh2001glyivfkmmu1ki	cloh3aqd2001elyivxiw7rnys	Peter is a real gentleman	پیتر یک جنتلمن واقعی است	2023-11-02 11:15:16.598
cloh3bxin001ilyivad0clyyi	cloh3aqd2001elyivxiw7rnys	this cannot be a real diamond	این نمی‌تواند یک الماس اصل باشد	2023-11-02 11:15:42.575
cloh3d6mv001llyivrzfj0eug	cloh3cspg001jlyivklven5gr	don't change the subject	موضوع را عوض نکن	2023-11-02 11:16:41.048
cloh3dl2s001nlyivfvkjul1c	cloh3cspg001jlyivklven5gr	did you notice any change?	آیا متوجه هیچ تغییری نشده‌ای	2023-11-02 11:16:59.764
cloh3ejjs001qlyivvxg0fqu6	cloh3dvjn001olyiv8kt5svx6	we are working as a team here	ما به عنوان یک تیم اینجا کار می‌کنیم	2023-11-02 11:17:44.44
cloh3f5y7001slyiv6fezgg06	cloh3dvjn001olyiv8kt5svx6	Jack wanted to play for his national team	جک می‌خواست برای تیم ملی‌اش بازی کند	2023-11-02 11:18:13.472
cloh3fsmr001vlyivikzwoqv2	cloh3fi80001tlyivtjkwx6pe	wait a minute please	یک دقیقه صبر کنید لطفاً	2023-11-02 11:18:42.868
cloh3gj7q001xlyiv4cwjv9r5	cloh3fi80001tlyivtjkwx6pe	it takes me 20 minutes to get to work	برای من ۲۰ دقیقه طول می‌کشد تا به سر کار برسم	2023-11-02 11:19:17.318
cloh3mjxj0020lyivzvdvayk6	cloh3lwde001ylyivugqwh0dv	stay calm and do your best	آرام بمان و بهترین تلاشت را بکن	2023-11-02 11:23:58.184
cloh3ndz20022lyivck92b670	cloh3lwde001ylyivugqwh0dv	we wish you the best of luck	ما بهترین اقبال را برای شما آرزومندیم	2023-11-02 11:24:37.118
cloh3pm5g0025lyiv32wyw73y	cloh3nwdc0023lyiv8bahv9em	several of my friends are learning English	چندین نفر از دوستان من انگلیسی یاد می‌گیرند	2023-11-02 11:26:21.028
cloh3pww30027lyiv6uqd94qi	cloh3nwdc0023lyiv8bahv9em	I have been to London several times	من چندین بار در لندن بودم	2023-11-02 11:26:34.948
cloh3raow002alyivnv6kth9l	cloh3qcc80028lyivagmgdahf	I have an idea to change the situation	من ایده‌ای برای تغییر موقعیت دارم	2023-11-02 11:27:39.489
cloh3t98n002clyiv9s9etqdo	cloh3qcc80028lyivagmgdahf	do you have a better idea?	آیا تو ایده بهتری داری	2023-11-02 11:29:10.919
cloh3vmhf002flyivbkbm2gq3	cloh3u63u002dlyivo5nmki0k	the human body is composed of about 60% water	بدن انسان از ۶۰ درصد آب تشکیل شده است	2023-11-02 11:31:01.396
cloh3wq2g002hlyiv0vcrfryf	cloh3u63u002dlyivo5nmki0k	rub this sun cream over your entire body	این کرم ضد آفتاب را روی کل بدنت بمال	2023-11-02 11:31:52.697
cloh3xox2002klyivo9nixm4e	cloh3xbjf002ilyiv3h7ik1eb	where are the kids?	بچه‌ها کجا هستند	2023-11-02 11:32:37.862
cloh3xzra002mlyivi7ynwe5r	cloh3xbjf002ilyiv3h7ik1eb	I'm just kidding you	من فقط دارم با تو شوخی می‌کنم	2023-11-02 11:32:51.91
cloh3zmev002plyiv1bodjlfz	cloh3y97y002nlyivuja5v03y	we need accurate information	ما به اطلاعات دقیق نیاز داریم	2023-11-02 11:34:07.927
cloh40ebp002rlyivyjrcelhu	cloh3y97y002nlyivuja5v03y	thank you for the information	از شما بابت اطلاعات ممنونم	2023-11-02 11:34:44.101
cloh4147v002ulyiv8bao0x2q	cloh40p5w002slyiv1c7h7eig	nothing happened recently	اخیرا هیچ اتفاقی نیفتاده است	2023-11-02 11:35:17.66
cloh41djp002wlyivs90fecjc	cloh40p5w002slyiv1c7h7eig	I have nothing to say	من چیزی برای گفتن ندارم	2023-11-02 11:35:29.749
cloh42odf002zlyivysqh5aas	cloh427kk002xlyivppeazoa4	20 years ago I was a kid	۲۰ سال قبل من یک بچه بودم	2023-11-02 11:36:30.436
cloh43ah50031lyivsvjw8eu6	cloh427kk002xlyivppeazoa4	I moved here about 5 years ago	من حدود ۵ سال پیش به اینجا نقل مکان کردم	2023-11-02 11:36:59.082
cloh44j7x0034lyiv34seh4r0	cloh43oo50032lyiv21z1kjbz	Emma is right person to lead the team	اما فرد درستی برای رهبری کردن تیم است	2023-11-02 11:37:57.07
cloh45a2k0036lyiv7l1aad1i	cloh43oo50032lyiv21z1kjbz	eating too much may lead to sickness	خوردن بیش از حد می‌تواند به بیماری منجر شود	2023-11-02 11:38:31.869
cloh4689w0039lyivpom4sn0x	cloh45sia0037lyivcx10qgtj	are you active in social media?	آیا شما در شبکه‌های مجازی فعال هستید	2023-11-02 11:39:16.197
cloh46pun003blyivay0nqkgu	cloh45sia0037lyivcx10qgtj	monkeys are highly social animals	میمون‌ها حیوانات بسیار اجتماعی هستند	2023-11-02 11:39:38.975
cloh47mie003elyivtp3w1tvf	cloh476bh003clyivz99xy6gk	do you understand what I'm saying?	آیا می‌فهمی که من چه دارم می‌گویم	2023-11-02 11:40:21.302
cloh485gd003glyiv4rirlfty	cloh476bh003clyivz99xy6gk	is there anyone here who understand Arabic?	آیا اینجا کسی هست که عربی بفهمد	2023-11-02 11:40:45.854
cloh4d1x8003jlyiv2amxtfm8	cloh4c37z003hlyivlwoapde7	whether or not you like it, I'm going out tonight	چه دوست داشته باشی و چه نه من امشب به بیرون می‌روم	2023-11-02 11:44:34.556
cloh4e4v1003llyivlx88zq68	cloh4c37z003hlyivlwoapde7	I doubt whether this plan will work	من شک دارم که آیا این پلان کار خواهد کرد یا نه	2023-11-02 11:45:25.021
cloh4ezlh003olyivtffpbxqp	cloh4ejaw003mlyivo1z7ba64	watch your step	جلوی پایت را نگاه کن	2023-11-02 11:46:04.853
cloh4g0a5003qlyiv36n7pzo2	cloh4ejaw003mlyivo1z7ba64	watch your language young man	مراقب حرف زدنت باش مرد جوان	2023-11-02 11:46:52.398
cloh4gp19003tlyivcgznu8cc	cloh4gfih003rlyiv8lxukg2i	let's go together	بیا با همدیگر برویم	2023-11-02 11:47:24.478
cloh4h42h003vlyiv3mr1n2tk	cloh4gfih003rlyiv8lxukg2i	they agreed to work together	آنها توافق کردند که با هم کار کنند	2023-11-02 11:47:43.961
cloh4ht6k003ylyiv55kjzoe7	cloh4hkde003wlyiv79mga7fh	follow me please	لطفاً مرا دنبال کنید	2023-11-02 11:48:16.508
cloh4i3rt0040lyivrc05dtwa	cloh4hkde003wlyiv79mga7fh	do you follow football?	آیا تو فوتبال را دنبال می‌کنی	2023-11-02 11:48:30.233
cloh4j42v0043lyivqbum8my4	cloh4ikg90041lyivo2u96vri	be polite to your parents	با والدینت مودب باش	2023-11-02 11:49:17.287
cloh4jm2c0045lyivrrphrjzs	cloh4ikg90041lyivo2u96vri	do you live with your parents?	آیا با والدینت زندگی می کنی	2023-11-02 11:49:40.597
cloh4k9w10048lyiv1g91syt1	cloh4jzki0046lyivjwrcjcai	stop it	تمامش کن / بس کن	2023-11-02 11:50:11.473
cloh4kk84004alyivtsef8cb5	cloh4jzki0046lyivjwrcjcai	nobody can stop me	هیچکس نمی‌تواند مرا متوقف کند	2023-11-02 11:50:24.869
cloh4lncr004dlyivqrbj43m6	cloh4ldde004blyivlp2sc77v	wash your face	صورتت را بشور	2023-11-02 11:51:15.579
cloh4m748004flyivd8b7cy8i	cloh4ldde004blyivlp2sc77v	his face is now too many people	چهره او برای بسیاری از افراد شناخته شده است	2023-11-02 11:51:41.193
cloh4n5ej004ilyiv8spxwmm8	cloh4mkfp004glyivnb7x2bzy	I know anything about Emma	من همه چیز در مورد اما را می‌دانم	2023-11-02 11:52:25.627
cloh4nitd004klyivhdxjfsux	cloh4mkfp004glyivnb7x2bzy	do you want anything to eat?	آیا چیزی برای خوردن می‌خواهید	2023-11-02 11:52:43.009
cloh4oe5p004nlyivb7imjlsp	cloh4nwiy004llyivhgjej9nj	we believe that God created the world	ما باور داریم که خدا دنیا را خلق کرده است	2023-11-02 11:53:23.63
cloh4ov2b004plyivmfwd2n4c	cloh4nwiy004llyivhgjej9nj	the new hotel is expected to create 200 jobs	انتظار می‌رود هتل جدید ۲۰۰ شغل ایجاد کند	2023-11-02 11:53:45.54
cloh4plcr004slyivrxsxcina	cloh4p2kq004qlyiv7slit7n0	you can use public transportation	تو میتوانی از وسیله حمل و نقل عمومی استفاده کنی	2023-11-02 11:54:19.612
cloh4pyfz004ulyivhntq3zxj	cloh4p2kq004qlyiv7slit7n0	here is a public place	اینجا یک مکان عمومی است	2023-11-02 11:54:36.576
cloh4r79j004xlyiv9g251e6v	cloh4qmce004vlyivrjcxrot3	it's already 9	الان در حال حاضر ساعت ۹ است	2023-11-02 11:55:34.664
cloh4s2hx004zlyiv3nlipg3a	cloh4qmce004vlyivrjcxrot3	the food is already on the table	غذا هم اکنون روی میز است	2023-11-02 11:56:15.141
cloh4sxgl0052lyiv64jnxv7y	cloh4s9nj0050lyivxd0j9vb3	may I speak to you for a minute?	آیا ممکن است که به مدت یک دقیقه با شما صحبت کنم	2023-11-02 11:56:55.269
cloh4t8wh0054lyivv6xrwmam	cloh4s9nj0050lyivxd0j9vb3	can you speak English fluently?	آیا میتوانی انگلیسی را به صورت روان صحبت کنی	2023-11-02 11:57:10.097
cloh4uqyv0057lyiv022bjhi0	cloh4u7d20055lyivy236vati	some people are smarter than others	بعضی از مردم از دیگران باهوش‌ترند	2023-11-02 11:58:20.167
cloh4vs5g0059lyivvadxoyj0	cloh4u7d20055lyivy236vati	you shouldn't expect others to do your work for you	نباید انتظار داشته باشی که دیگران کار شما را برای تو انجام دهند	2023-11-02 11:59:08.357
cloh5gucm005clyivdiwcyi34	cloh5g4jo005alyivd6ja5fnh	I want something to read	من چیزی می‌خواهم که بخوانم	2023-11-02 12:15:30.983
cloh5hdj9005elyivavr1td33	cloh5g4jo005alyivd6ja5fnh	read the sentence out loud	این جمله را با صدای بلند بخوان	2023-11-02 12:15:55.845
cloh5ilbu005hlyivz7bilnn9	cloh5i220005flyivq3d74ayk	you are not on my level	تو در سطح من نیستی	2023-11-02 12:16:52.602
cloh5j3yb005jlyivb352s47s	cloh5i220005flyivq3d74ayk	chest requires a high level of concentration	شطرنج به سطح بالایی از تمرکز نیاز دارد	2023-11-02 12:17:16.739
cloh5kph2005mlyivexc6rdtc	cloh5k48q005klyiv9z985qnn	allow yourself to be a better person	به خودت اجازه بده که فرد بهتری باشی	2023-11-02 12:18:31.286
cloh5l4xb005olyivp6e4lz79	cloh5k48q005klyiv9z985qnn	do you allow me to sit here?	آیا اجازه میده اینجا بنشینم	2023-11-02 12:18:51.311
cloh5m9z0005rlyiv688jieyn	cloh5ld71005plyivupmtms2h	please add some sugar to this coffee	لطفاً کمی شکر به این قهوه اضافه کنید	2023-11-02 12:19:44.509
cloh5n5re005tlyivkbf9yqf4	cloh5ld71005plyivupmtms2h	garlic can add flavour to your food	سیر می‌تواند طعم به غذای شما اضافه کند	2023-11-02 12:20:25.706
cloh5o8lm005wlyivz70pl603	cloh5njtm005ulyiv8wgsz8pt	this office is my work place	این دفتر محل کار من است	2023-11-02 12:21:16.042
cloh5oi2e005ylyiv39sl99oe	cloh5njtm005ulyiv8wgsz8pt	where is the Post Office	اداره پست کجاست	2023-11-02 12:21:28.31
cloh5pp330061lyivgxc7rqnp	cloh5pcc3005zlyive76ahf7a	you're spending too much	تو داری بیش از حد خرج می‌کنی	2023-11-02 12:22:24.063
cloh5q4640063lyivfauc3obf	cloh5pcc3005zlyive76ahf7a	how did you spend your free time?	اوقات فراغت خود را چطور صرف کردی	2023-11-02 12:22:43.613
cloh5qxth0066lyiv43i9gejo	cloh5qebw0064lyiv0gykoa9s	would you please close the door?	آیا می‌شود لطفاً در را ببندیم	2023-11-02 12:23:22.037
cloh5rdlf0068lyivfxt2ch8j	cloh5qebw0064lyiv0gykoa9s	come in the door is open	بیایید داخل در باز است	2023-11-02 12:23:42.484
cloh5sth7006blyiv8xnzhrnk	cloh5sdrt0069lyivly6gieeb	thanks God I mean excellent health	خدا را سپاس من در سلامت عالی هستم	2023-11-02 12:24:49.723
cloh5t4p2006dlyiv2nfvhjhp	cloh5sdrt0069lyivly6gieeb	eating vegetable is good for your health	خوردن سبزیجات برای سلامتیت خوب است	2023-11-02 12:25:04.263
cloh5tv5d006glyiv0f3ufor0	cloh5td5p006elyiv3gz15nz8	I'm not the person I used to be	من آن فردی که قبلا بودم نیستم	2023-11-02 12:25:38.545
cloh5u8qq006ilyivwd4l0aeh	cloh5td5p006elyiv3gz15nz8	who is the person in charge?	چه کسی پاسخگو است	2023-11-02 12:25:56.162
cloh5v4ag006llyivvd6h3bt1	cloh5ufkv006jlyiv6jl91s81	art and English are my best subjects	هنر به انگلیسی بهترین موضوعات مورد علاقه من است	2023-11-02 12:26:37.048
cloh5vgty006nlyiv0ushj7lg	cloh5ufkv006jlyiv6jl91s81	what's your favourite kind of art?	نوع هنر مورد علاقه شما چیست	2023-11-02 12:26:53.302
cloh5wiie006qlyiv6qyp8nu8	cloh5vxtg006olyiv7k6w2xmk	are you sure about what you said?	آیا در مورد چیزی که گفتید مطمئن هستید	2023-11-02 12:27:42.135
cloh5wr3i006slyivkm2tbq85	cloh5vxtg006olyiv7k6w2xmk	I'm not really sure	من واقعا مطمئن نیستم	2023-11-02 12:27:53.263
cloh5xgjj006vlyivoo3afub9	cloh5x3nj006tlyivvymsblew	nobody likes War	هیچکس جنگ را دوست ندارد	2023-11-02 12:28:26.239
cloh5xugt006xlyivlsi8zlug	cloh5x3nj006tlyivvymsblew	far is something to avoid	جنگ چیزی است که باید از آن دوری کرد	2023-11-02 12:28:44.285
clokcw0ro0002lysm0txvpxzl	clokcv2h30000lysmat6s89af	we met at college, the rest is history	ما در دانشگاه همدیگر را ملاقات کردیم بقیه‌اش را همه می‌دانند	2023-11-04 18:06:34.981
clokcx2g60004lysmi7kum0st	clokcv2h30000lysmat6s89af	our family has a history of the diabetes	خانواده ما سابقه دیابت دارند	2023-11-04 18:07:23.815
clokcxygu0007lysmqapqv6sd	clokcxhqj0005lysmq00tin5r	who else came to the party?	دیگر چه کسی به مهمانی آمد	2023-11-04 18:08:05.311
clokcy9fu0009lysmkm9p1z1d	clokcxhqj0005lysmq00tin5r	there is a political party here	اینجا یک حزب سیاسی وجود دارد	2023-11-04 18:08:19.53
clokczlce000clysma61fbems	clokcz3r0000alysm2ls47kc5	find happiness within yourself	خوشحالی درون خودت را پیدا کن	2023-11-04 18:09:21.615
clokd09h8000elysmy9cv0jtr	clokcz3r0000alysm2ls47kc5	the tickets should reach you within a week	بلیط‌ها باید در ظرف یک هفته به دست شما برسند	2023-11-04 18:09:52.893
clokd2s6j000hlysm7adsm9sj	clokd2fr5000flysmbigter8t	children grow so quickly	بچه‌ها خیلی سریع رشد می‌کنند	2023-11-04 18:11:50.443
clokd3ds6000jlysmm53uldjs	clokd2fr5000flysmbigter8t	nothing seems to grow in this soil	به نظر نمی‌رسد که هیچ چیزی در این خاک رشد کند	2023-11-04 18:12:18.439
clokd417p000mlysme13agww3	clokd3ob1000klysme3butslu	I didn't expect that result	من انتظار آن نتیجه را نداشتم	2023-11-04 18:12:48.806
clokd4ldb000olysm2bsh49hk	clokd3ob1000klysme3butslu	I was disappointed with the result	من با نتیجه ناامید بودم	2023-11-04 18:13:14.928
clokd5vvc000rlysmqzv60ewv	clokd5cgu000plysmjfr93n9y	may I open the box?	آیا ممکن است جعبه را باز کنم	2023-11-04 18:14:15.192
clokd6583000tlysm8hp3884m	clokd5cgu000plysmjfr93n9y	keep your eyes open	چشمانت را باز نگه دار	2023-11-04 18:14:27.316
clokd70tj000wlysmattstd3f	clokd6mdu000ulysmz6zvg7jy	some men shave every morning	بعضی از مردان هر صبح صورتشان را اصلاح می‌کنند	2023-11-04 18:15:08.264
clokd7dmu000ylysmshxqup43	clokd6mdu000ulysmz6zvg7jy	how are you this morning?	امروز صبح حالت چطور است	2023-11-04 18:15:24.871
clokd8cqt0011lysmwae1ns33	clokd7vac000zlysmbq9anewi	give me a reason for your mistake	یک دلیل برای اشتباهت به من بده	2023-11-04 18:16:10.373
clokd8uu50013lysmaivvdw0o	clokd7vac000zlysmbq9anewi	no one knows the reason	هیچکس دلیل را نمی‌داند	2023-11-04 18:16:33.821
clokd9u5c0016lysmn6zn5sh9	clokd9f8u0014lysmvyilsjrz	your blood pressure is too low	فشار خون شما بسیار پایین است	2023-11-04 18:17:19.585
clokdapmg0018lysmv9k6r93u	clokd9f8u0014lysmvyilsjrz	please speak in a low voice	لطفاً با صدای پایین صحبت کنید	2023-11-04 18:18:00.377
clokdbm6q001blysm0lwobxw3	clokdb5vm0019lysmum1vm3y3	did you win the match?	آیا شما برنده شدید	2023-11-04 18:18:42.579
clokdbyq7001dlysmn6n0168o	clokdb5vm0019lysmum1vm3y3	don't give up you are winning	تسلیم نشو تو داری برنده میشی	2023-11-04 18:18:58.831
clokdcywb001glysmt1f17gog	clokdc92k001elysm84bzc98i	you didn't do enough research	شما به اندازه کافی تحقیق نکردید	2023-11-04 18:19:45.707
clokddbs8001ilysms02mejk3	clokdc92k001elysm84bzc98i	I want you to do some research	من از شما می‌خواهم که مقداری تحقیق کنید	2023-11-04 18:20:02.409
clokde8ai001llysmoig986ki	clokddsik001jlysmg8di2pp9	look at that girl	به آن دختر نگاه کن	2023-11-04 18:20:44.538
clokdf2oj001nlysmo7gao5pz	clokddsik001jlysmg8di2pp9	Emma is a beautiful girl	اما دختر زیبایی است	2023-11-04 18:21:23.923
clokdg2es001qlysmh618o22l	clokdfmob001olysmzp7guo33	Mori is a really nice guy	موری مرد بسیار خوبی است	2023-11-04 18:22:10.228
clokdgelk001slysmxe30e1ie	clokdfmob001olysmzp7guo33	guys let's play football tonight	بچه‌ها بیایید امشب فوتبال بازی کنیم	2023-11-04 18:22:26.024
clokdh9wa001vlysmwnm2616e	clokdgorc001tlysmegtpn9f2	the boss left the station early	اتوبوس ایستگاه را زود ترک کرد	2023-11-04 18:23:06.587
clokdhw25001xlysmjm9oybwm	clokdgorc001tlysmegtpn9f2	that is good you arrived too early	خوب از تو خیلی زود رسیدی	2023-11-04 18:23:35.309
clokdihtr0020lysmp9elo6qs	clokdi6iu001ylysm9a9sbuec	how is the food?	غذا چطور است	2023-11-04 18:24:03.519
clokdir8n0022lysm368kjph4	clokdi6iu001ylysm9a9sbuec	where is my food?	غذای من کجاست	2023-11-04 18:24:15.72
clokdjib80025lysmddqap6a4	clokdj4z90023lysmdvwn3ba3	wait a moment please	یک لحظه صبر کنید لطفاً	2023-11-04 18:24:50.804
clokdjv8p0027lysmf29b81k2	clokdj4z90023lysmdvwn3ba3	I'm busy at the moment	من در این لحظه سرم شلوغ است	2023-11-04 18:25:07.561
clokdkwuf002alysm54c9gy1k	clokdk9es0028lysmp1wannw7	don't worry dad takes care of himself	نگران نباش پدر مراقب خودش است	2023-11-04 18:25:56.295
clokdlj9m002clysmdxa63spi	clokdk9es0028lysmp1wannw7	let the boy do that by himself	اجازه بده پسر خودش به تنهایی آن را انجام دهد	2023-11-04 18:26:25.355
clokdmozf002flysmffuica4w	clokdm96l002dlysmmc5l8rox	it's hot inside we need fresh air	داخل گرم است ما به هوای تازه نیاز داریم	2023-11-04 18:27:19.419
clokdndx9002hlysmza94bp29	clokdm96l002dlysmmc5l8rox	this tire needs some air	این لاستیک کمی هوا نیاز دارد	2023-11-04 18:27:51.741
clokdo3a6002klysmacst7z0x	clokdnmdu002ilysm5nwbljgt	you are not a teacher anymore	تو دیگر یک معلم نیستی	2023-11-04 18:28:24.606
clokdodhz002mlysm9mso58hy	clokdnmdu002ilysm5nwbljgt	who is your English teacher?	معلم انگلیسی تو چه کسی است	2023-11-04 18:28:37.848
clokdpadb002plysmfo23gcfl	clokdosqj002nlysmzme6xowd	you cannot force them to stay	تو نمی‌توانی آنها را مجبور کنی که بمانند	2023-11-04 18:29:20.447
clokdpnlu002rlysm6rrm2kbe	clokdosqj002nlysmzme6xowd	Jack always wanted to join the Air Force	جک همیشه می‌خواست به نیروی هوایی بپیوندد	2023-11-04 18:29:37.603
clokdqu43002ulysmlvek3in8	clokdqccc002slysmdypn8o74	what can you offer?	شما چه چیزی می‌توانید پیشنهاد دهید	2023-11-04 18:30:32.691
clokdrd3h002wlysm33zgrzwv	clokdqccc002slysmdypn8o74	what did they offer?	آنها چه پیشنهادی دادند	2023-11-04 18:30:57.294
clokds8b0002zlysm5flzzwry	clokdrnfx002xlysm03ikfwem	that's enough leave me alone	بس است تنهایم بگذار	2023-11-04 18:31:37.74
clokdsnjr0031lysm5a0zilz1	clokdrnfx002xlysm03ikfwem	do you have enough money to pay the rent?	آیا پول کافی برای پرداخت اجاره داری	2023-11-04 18:31:57.495
clokdtumg0034lysm1vnhwxoq	clokdt8cd0032lysm0u5zizr1	education starts at home	آموزش و پرورش از خانه شروع می‌شود	2023-11-04 18:32:53.32
clokdu65k0036lysm0trwl6qu	clokdt8cd0032lysm0u5zizr1	education is the key to success	آموزش کلید موفقیت است	2023-11-04 18:33:08.265
clokdv1px0039lysmz3ol46pc	clokdujl20037lysm15lqf18e	can you swim across the river?	آیا می‌توانید در عرض رودخانه شنا کنی	2023-11-04 18:33:49.174
clokdvmmf003blysm4dxhozoi	clokdujl20037lysm15lqf18e	this library is just across the road	کتابخانه دقیقاً روبروی جاده است	2023-11-04 18:34:16.263
clokdxt4a003elysmqhvcshn9	clokdwi1k003clysmlta3zo0v	although Bob is rich he's not happy	اگرچه باب ثروتمند است ولی خوشحال نیست	2023-11-04 18:35:57.995
clokdyt3e003glysms309yq0o	clokdwi1k003clysmlta3zo0v	I will be there by 5 although I may be late	من قبل از ساعت ۵ آنجا خواهم بود اگرچه ممکن است دیر شود	2023-11-04 18:36:44.618
cloke87k8003llysm5z4gkztz	cloke0kqo003hlysmygf306e3	remember to take your keys	یادت باشد که کلید هایت را برداری	2023-11-04 18:44:03.272
clokeac4h003nlysm8m5h3lls	cloke0kqo003hlysmygf306e3	nobody remembers what you did	هیچکس به یاد نمی‌آورد که شما چه کردید	2023-11-04 18:45:42.497
clokvsway0002lyr70lbwd86w	clokvscef0000lyr7ge7m8cq3	my left foot is asleep	پای چپ من خوابیده است	2023-11-05 02:56:01.93
clokvtf9i0004lyr7wbe2uen8	clokvscef0000lyr7ge7m8cq3	what happened to your foot?	چه اتفاقی برای پایت افتاده است	2023-11-05 02:56:26.502
clokvuoit0007lyr71pig22gi	clokvu87g0005lyr7v20x9ayt	hang on a second please	یک ثانیه صبر کنید لطفاً	2023-11-05 02:57:25.158
clokvv2z20009lyr71q25i8y6	clokvu87g0005lyr7v20x9ayt	give me a second chance	به من یک شانس دوم بدهید	2023-11-05 02:57:43.886
clokvvpd6000clyr72287dm41	clokvvf2i000alyr72qi1ikps	who's that boy?	آن پسر کیست	2023-11-05 02:58:12.907
clokvw8ho000elyr7kgpugmbw	clokvvf2i000alyr72qi1ikps	all the boys went away	همه پسران فرار کردند	2023-11-05 02:58:37.693
clokwdd5m0001ly61vhz9vkjo	clokvwi3q000flyr780etrgbx	let me see maybe I can help you	بگذار ببینم شاید من بتوانم کمک کنم	2023-11-05 03:11:56.891
clokwe1110003ly61qumdzbas	clokvwi3q000flyr780etrgbx	maybe you're right	شاید حق با تو باشه	2023-11-05 03:12:27.829
clokwfqj20006ly61on7m4ewc	clokwerry0004ly61qdn976sc	come toward me and hug me	به سمت من بیا و مرا بغل کن	2023-11-05 03:13:47.535
clokwg5rj0008ly61jvm81hiu	clokwerry0004ly61qdn976sc	my attitude toward life has changed	دیدگاهم نسبت به زندگی عوض شده است	2023-11-05 03:14:07.279
clokwhy4f000bly61ztr3dm62	clokwgxjf0009ly61x7m0deon	dogs are able to swim well	سگ‌ها قادرند به خوبی شنا کنند	2023-11-05 03:15:30.687
clokwivtb000dly610j5rehst	clokwgxjf0009ly61x7m0deon	I might be able to fix that car	من ممکن است بتوانم آن ماشین را تعمیر کنم	2023-11-05 03:16:14.352
clokwkv9r000lly6122f22yzk	clokwkfad000jly61jlflqf2g	that is a stupid policy	آن یک سیاست احمقانه است	2023-11-05 03:17:46.96
clokwl9fx000nly61yx4kl8es	clokwkfad000jly61jlflqf2g	what is your return policy?	سیاست پس گرفتن کالای شما چیست	2023-11-05 03:18:05.325
clokwn05o000qly6175kmwm70	clokwmp8i000oly61zyshix9m	everything is ready to learn English	همه چیز برای یاد گرفتن انگلیسی آماده است	2023-11-05 03:19:26.604
clokwn9es000sly61jnjcrpnn	clokwmp8i000oly61zyshix9m	everything is ok	همه چیز مرتب است	2023-11-05 03:19:38.596
clokwrln4000vly61sc5qfuho	clokwnlo5000tly61mwis3mrc	mom loves children more than anything	مامان بچه‌ها را بیشتر از همه چیز دوست دارد	2023-11-05 03:23:01.073
clokws3bh000xly618vecmqa9	clokwnlo5000tly61mwis3mrc	do you believe in love at first sight?	آیا به عشق در نگاه اول اعتقاد داری	2023-11-05 03:23:23.982
clokwtop80010ly614oujrlj1	clokwt5p9000yly61m3xf43pk	visa application stage 28 days to process	پرونده‌های ویزا ۲۸ روز زمان می‌برد که رسیدگی شود	2023-11-05 03:24:38.348
clokwu5rh0012ly61vmgf6l6f	clokwt5p9000yly61m3xf43pk	don't worry learning process takes time	نگران نباش روند یادگیری زمان می‌برد	2023-11-05 03:25:00.462
clokwuvc50015ly61scaroco2	clokwug790013ly61rjvv71w0	do you like music?	آیا تو موسیقی را دوست داری	2023-11-05 03:25:33.605
clokwvaye0017ly6130g4ffav	clokwug790013ly61rjvv71w0	we can talk about music	ما می‌توانیم در مورد موزیک صحبت کنیم	2023-11-05 03:25:53.846
clokwx63s001aly6151d4h52s	clokwwal10018ly61fak2x9d4	the cast comes to $100 including meals	هزینه ۱۰۰ دلار می‌شود شامل وعده‌های غذایی	2023-11-05 03:27:20.872
clokwyovw001cly61pqx4bllg	clokwwal10018ly61fak2x9d4	this book have 60 pace including their index	این کتاب ۶۰ صفحه دارد همراه با فهرست	2023-11-05 03:28:31.869
clomwhhh50002lyxsrhgvlpeb	\N	act your age	مطابق سن و سالت رفتار کن	2023-11-06 12:50:41.465
clomwocfd0004lyxsi4750s2u	\N	top left home at the age of 16	باب خانه را در سن ۱۶ سالگی ترک کرد	2023-11-06 12:56:01.513
clomwu5wv0007lyxsx2y4wk6v	clomwtp7s0005lyxsc8k1jnnf	consider it done	آن کار را انجام شده در نظر بگیر	2023-11-06 13:00:33.008
clomwvblf0009lyxsrkk1ftt5	clomwtp7s0005lyxsc8k1jnnf	parents should consider children's feelings	والدین باید در نظر بگیرند احساسات بچه‌ها را	2023-11-06 13:01:27.027
clomwx854000clyxs39hlxbtf	clomwwgpa000alyxstmtrjeif	it appears that Bob is a student	مشخص می‌شود که باب یک دانشجو است	2023-11-06 13:02:55.864
clomwy63o000elyxsmhzlbo75	clomwwgpa000alyxstmtrjeif	they suddenly appeard from nowhere	آنها ناگهان از ناکجا آباد ظاهر شدند	2023-11-06 13:03:39.877
clomwz26m000hlyxs63hsopp6	clomwyohx000flyxsvmoeiq6l	I actually do not know anything	من در واقع چیزی نمی‌دانم	2023-11-06 13:04:21.454
clomwzgch000jlyxs6j4l6jvb	clomwyohx000flyxsvmoeiq6l	tell me what actually happened?	به من بگو در واقع چه اتفاقی افتاد	2023-11-06 13:04:39.809
clomx03a0000mlyxs96f255q7	clomwzoxp000klyxs0p7cmxcf	we are buying clothes for winter	ما داریم لباس برای زمستان می‌خریم	2023-11-06 13:05:09.528
clomx0eti000olyxslkakmu3v	clomwzoxp000klyxs0p7cmxcf	what did you buy?	تو چه چیزی خریدی	2023-11-06 13:05:24.486
clomx14b6000rlyxsjb2wzzsk	clomx0pl7000plyxs50zw5nvg	we are probably right	احتمالاً حق با ماست	2023-11-06 13:05:57.523
clomx1gzq000tlyxsrnaw75bb	clomx0pl7000plyxs50zw5nvg	you probably think I am crazy	تو احتمالاً فکر می‌کنی من دیوانه‌ام	2023-11-06 13:06:13.958
clomx2ne6000wlyxs8te9ch3w	clomx1qoa000ulyxs6two2ffz	the human mind is magnificent	ذهن انسان عالی و بی‌نظیر است	2023-11-06 13:07:08.91
clomx3hgl000ylyxscn6trk7z	clomx1qoa000ulyxs6two2ffz	some parrots can imitate human speech	بعضی از طوطی‌ها می‌توانند صدای انسان را تقلید کنند	2023-11-06 13:07:47.878
clomx49t30011lyxsalm48lpk	clomx3s0l000zlyxs0zl01sa2	can we wait here?	آیا ما می‌توانیم اینجا منتظر بمانیم	2023-11-06 13:08:24.615
clomx4mkp0013lyxsjl3m9x44	clomx3s0l000zlyxs0zl01sa2	don't hurry I'm waiting outside	عجله نکن من بیرون منتظر می‌مانم	2023-11-06 13:08:41.161
clomx6bn60016lyxsrc1l0yuy	clomx5p780014lyxsoz0v74ok	that car served me right	آن ماشین به درستی به من خدمت کرد	2023-11-06 13:10:00.306
clomx6zlm0018lyxsqxjk78ke	clomx5p780014lyxsoz0v74ok	what time will dinner be served?	شام چه ساعتی سفت خواهد شد	2023-11-06 13:10:31.355
clomx7z49001blyxsm2ozcbun	clomx7lcu0019lyxs0riv23aj	what time does the market open?	بازار ساعت چند باز می‌شود	2023-11-06 13:11:17.385
clomx8d7e001dlyxsi54ymcec	clomx7lcu0019lyxs0riv23aj	are you sure there is a market for this product?	آیا شما مطمئن هستید برای این محصول بازاری وجود دارد	2023-11-06 13:11:35.643
clomx9ye6001glyxswcs75zmn	clomx8qxs001elyxsjo9yv6ul	our neighbour died when I was 5	وقتی ۵ ساله بودم همسایه‌مان مرد	2023-11-06 13:12:49.758
clomxah8j001ilyxsb67bpb9d	clomx8qxs001elyxsjo9yv6ul	I'm dying to Be With You	من می‌میرم که با تو باشم	2023-11-06 13:13:14.179
clomy3mbe001llyxsvjdqke8g	clomxaza6001jlyxs6d0hdsb3	you should send them an email	تو باید به آنها ایمیل ارسال کنی	2023-11-06 13:35:53.786
clomy3xsi001nlyxsoi7omb4b	clomxaza6001jlyxs6d0hdsb3	please send me some money	لطفاً مقدار پول برای من بفرستید	2023-11-06 13:36:08.658
clomy4zsp001qlyxsesu4ldvj	clomy49si001olyxs35fdhqog	oh my God I didn't expect to see you here	وای خدای من من انتظار نداشتم که تو را اینجا ببینم	2023-11-06 13:36:57.914
clomy5nlx001slyxs6r0clp06	clomy49si001olyxs35fdhqog	we expect good results	ما انتظار نتایج خوب داریم	2023-11-06 13:37:28.773
clomy7fgv001vlyxsvtzpj9ki	clomy68tl001tlyxs015t90jv	do you sense anything	آیا تو چیزی حس می‌کنی	2023-11-06 13:38:51.535
clomy8gcc001xlyxsxylqg0j1	clomy68tl001tlyxs015t90jv	it was a joke where is your sense of humour?	آن یک جوک بود حس شوخ طبعی ات کجاست	2023-11-06 13:39:39.325
clomy96g30020lyxseslqj87p	clomy8qqs001ylyxs7c5rooaq	they are building a mall nearby	آنها دارند در این نزدیکی پاساژ می‌سازند	2023-11-06 13:40:13.155
clomya05d0022lyxsqxrq41jy	clomy8qqs001ylyxs7c5rooaq	we want to build a better future for our children	ما می‌خواهیم برای بچه‌هایمان آینده بهتری بسازیم	2023-11-06 13:40:51.65
clomyb7o90025lyxsblrg418b	clomyacua0023lyxsig6mtfh2	take it easy, stay cool	سخت نگیر خونسرد باش	2023-11-06 13:41:48.058
clomybk0m0027lyxs1p0l46nu	clomyacua0023lyxsig6mtfh2	would you please stay here?	آیا ممکن است اینجا بمانید لطفاً	2023-11-06 13:42:04.054
clomyd0pl002alyxse6yqy7ql	clomyci1t0028lyxswchpa9si	leaves fall from trees in Fall	برگ‌ها در پاییز از درختان می‌افتند	2023-11-06 13:43:12.345
clomydx98002clyxskiommtcd	clomyci1t0028lyxswchpa9si	Jack slipped and fall on the ice	جک سر خورد و روی یخ افتاد	2023-11-06 13:43:54.524
clomyg46q002flyxsxfxu2qca	clomye9jw002dlyxsbdeo9u1b	every nation has its own myths	هر ملتی افسانه‌های خودش را دارد	2023-11-06 13:45:36.818
clomygsej002hlyxsh7raikh8	clomye9jw002dlyxsbdeo9u1b	nations are fighting for freedom	ملت‌ها دارند برای آزادی می‌جنگند	2023-11-06 13:46:08.203
clomyjz81002klyxs8fbmwx70	clomyjllo002ilyxskz7g6bd5	we need a plan to learn better	ما نیاز داریم به یک پلن برای بهتر یاد گرفتن	2023-11-06 13:48:37.009
clomyl5dx002mlyxscb2fy5b5	clomyjllo002ilyxskz7g6bd5	I don't plan to stay here much longer	من برنامه نمی‌چینم که بیشتر از این اینجا بمانم	2023-11-06 13:49:31.653
clomym159002plyxsnkpog6wd	clomyleke002nlyxsto5ff7fy	this knife doesn't cut very well	این چاقو به خوبی نمی‌برد	2023-11-06 13:50:12.813
clomymgy1002rlyxs1yna2epp	clomyleke002nlyxsto5ff7fy	be careful don't cut your finger	مراقب باش انگشتت را نبری	2023-11-06 13:50:33.289
clomynjuo002ulyxsyxpgtdri	clomymwjt002slyxsu9m4i3im	Emma is at Art College	اما در کالج هنر است	2023-11-06 13:51:23.713
clomyo09e002wlyxss8ho65sl	clomymwjt002slyxsu9m4i3im	did you go to that college?	آیا شما به آن کالج رفتید	2023-11-06 13:51:44.978
clomyqlcq002zlyxsnm7alg9r	clomyodej002xlyxsn4zwgzob	my interests are philosophy and chess	علاقه‌مندی‌های من فلسفه و شطرنج است	2023-11-06 13:53:45.626
clomyqwqo0031lyxs6pqnv4du	clomyodej002xlyxsn4zwgzob	I have an interest in science	من علاقه‌ای در علم دارم	2023-11-06 13:54:00.385
clomysh6t0034lyxswygoytbo	clomys02i0032lyxsd5ifc5hp	most people are afraid of death	بیشتر مردم از مرگ می‌ترسند	2023-11-06 13:55:13.541
clomytaq70036lyxsrt38pqpy	clomys02i0032lyxsd5ifc5hp	nobody can escape from death	هیچکس نمی‌تواند از مرگ فرار کند	2023-11-06 13:55:51.824
clomytzss0039lyxsin5vlsso	clomytmgw0037lyxsfafmxfbb	I took a course in graphic design	من یک درس در طراحی گرافیک برداشتم	2023-11-06 13:56:24.317
clomyumqf003blyxsxwsey3am	clomytmgw0037lyxsfafmxfbb	do you have a course for beginners?	آیا شما دوره‌ای برای مبتدیان دارید	2023-11-06 13:56:54.039
clomyvfv1003elyxsm513q7nr	clomyuwck003clyxs1zleqh94	there is someone outside the house	فردی بیرون از خانه است	2023-11-06 13:57:31.79
clomyvuzw003glyxstit1xqdc	clomyuwck003clyxs1zleqh94	you have to ask someone else	شما باید از فرد دیگری بپرسید	2023-11-06 13:57:51.404
clomyx2sh003jlyxs9myjo36h	clomywhko003hlyxsk2q7uj5s	you need some experience to work here	شما برای کار کردن در اینجا کمی تجربه نیاز دارید	2023-11-06 13:58:48.161
clomyxouj003llyxsqsyi2vtj	clomywhko003hlyxsk2q7uj5s	do you have any experience of working with kids?	آیا شما تجربه‌ای از کار کردن با بچه‌ها دارید	2023-11-06 13:59:16.748
clomyyi7u003olyxskil2cphs	clomyxyli003mlyxsn88iccu4	please stay behind me	لطفاً پشت سر من بمانید	2023-11-06 13:59:54.811
clomyyud1003qlyxsq6yvake2	clomyxyli003mlyxsn88iccu4	what is behind the door?	چه چیزی پشت در است	2023-11-06 14:00:10.549
clomyzhq7003tlyxspmonw42t	clomyz41v003rlyxs8hfstrei	you can't reach me easily	تو نمی‌توانی به آسانی به من برسی	2023-11-06 14:00:40.832
clomz01g8003vlyxs429kvv96	clomyz41v003rlyxs8hfstrei	the ladder won't reach the roof	نردبان به سقف دیوار نخواهد رسید	2023-11-06 14:01:06.392
clomz1c8q003ylyxs17zqynu6	clomz0liv003wlyxscn6tztnx	you will need a local guide in this trip	شما در این سفر به یک راهنمای محلی نیاز خواهید داشت	2023-11-06 14:02:07.034
clomz1tat0040lyxsspoe5qvv	clomz0liv003wlyxscn6tztnx	all children go to the local schools	همه بچه‌ها به مدارس محلی می‌روند	2023-11-06 14:02:29.141
clomz3omv0043lyxslohrcbdn	clomz24880041lyxs2qp3xzzw	lack of honesty can kill a marriage	فقدان صداقت می‌تواند یک ازدواج را از بین ببرد	2023-11-06 14:03:56.408
clomz4pp70045lyxs5oju3rxy	clomz24880041lyxs2qp3xzzw	it wouldn't kill you to apologies	عذرخواهی کردن تو را نخواهد کشت	2023-11-06 14:04:44.443
clomz5kjm0048lyxss07r7798	clomz576z0046lyxs1156vry9	it took me 6 months to learn painting	برای من شش ماه طول کشید که نقاشی کردن یاد بگیرم	2023-11-06 14:05:24.418
clomz5z0m004alyxssyhj2kpm	clomz576z0046lyxs1156vry9	Peter came home at 6	پیتر در ساعت ۶ به خانه آمد	2023-11-06 14:05:43.174
clomz6lm9004dlyxsi8jrj24p	clomz68qu004blyxskbxa13bi	please remind seated	لطفاً نشسته بمانید	2023-11-06 14:06:12.466
clomz7nsu004flyxs2h96o3eq	clomz68qu004blyxskbxa13bi	I was shocked and remaind silent	من شوکه بودم و ساکت ماندم	2023-11-06 14:07:01.951
clomz8wpv004ilyxskogodet2	clomz8l3h004glyxsu2699zcn	the effect of practise was immediate	تاثیر تمرین فوری بود	2023-11-06 14:08:00.163
clomz9coz004klyxs9ij7ybmn	clomz8l3h004glyxsu2699zcn	this medicine has no side effects	این دارو هیچ اثرات جانبی ندارد	2023-11-06 14:08:20.868
clomza2f9004nlyxs1sb5ndeh	clomz9ox4004llyxsv60icmc0	what do you suggest?	شما چه چیز پیشنهاد می‌دهید	2023-11-06 14:08:54.214
clomzafvl004plyxs0akjf6nb	clomz9ox4004llyxsv60icmc0	we suggest you to help your brother	ما به شما پیشنهاد می‌دهیم که به برادرت کمک کنید	2023-11-06 14:09:11.65
clomzb601004slyxspyc9a6qy	clomzamqg004qlyxsqjmzyk32	I missed my English class yesterday	من دیروز کلاس انگلیسی را از دست دادم	2023-11-06 14:09:45.505
clomzbsuf004ulyxsj5njaw50	clomzamqg004qlyxsqjmzyk32	which class are you in this year?	امسال در کدام کلاس هستی	2023-11-06 14:10:15.112
clomzcvjy004xlyxsui5y8n9y	clomzcike004vlyxsa1oxh80g	everything is under control	همه چیز تحت کنترل است	2023-11-06 14:11:05.278
clomzd905004zlyxsotyeg9s6	clomzcike004vlyxsa1oxh80g	stay calm control yourself	آرام بمان خودت را کنترل کن	2023-11-06 14:11:22.71
clomze6cj0052lyxs74crk5jo	clomzduni0050lyxsedshke0o	raise your left hand please	لطفاً دست چپتان را بالا بیاورید	2023-11-06 14:12:05.923
clomzeqyd0054lyxsg4dt5mjs	clomzduni0050lyxsedshke0o	the government planned to raise taxes	دولت برنامه داشت که مالیات را بالا ببرد	2023-11-06 14:12:32.63
clomzflo50057lyxsfb6r37er	clomzfblb0055lyxs7xxgvpyr	I don't care	من اهمیت نمی‌دهم	2023-11-06 14:13:12.437
clomzfwp10059lyxs2h3w3xa5	clomzfblb0055lyxs7xxgvpyr	nobody cares about your problems	هیچکس به مشکلات تو اهمیت نمی‌دهد	2023-11-06 14:13:26.726
clomzi07s005clyxssas988cl	clomzgnuv005alyxs1j1iv595	perhaps you can help me	احتمالاً شما بتوانید مرا کمک کنید	2023-11-06 14:15:04.6
clomzicgz005elyxszeu78xcq	clomzgnuv005alyxs1j1iv595	perhaps you misunderstood	احتمالاً شما اشتباه متوجه شدید	2023-11-06 14:15:20.484
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, user_id, token, r_token, invoked, expires_at, r_expires_at, created_at) FROM stdin;
clo6riths0001lyi6mq3alp9s	clo6q6r0r0000lyedmjryjryy	BqiEJ6Jtj9/+tzljysGvQ0pIMqNJhNQdGXy6ddi55lg=	gxAEtWZ03KONxXtJhqpdgNAg7FaT1wtDM5i6eLleK0I=	f	2023-10-31 05:47:26.798	2023-11-19 05:47:26.799	2023-10-26 05:47:26.8
cloa4t78t0001ly2sqdqferu9	clo6q6r0r0000lyedmjryjryy	5pGto4GLB8bR+6Yjk6ePr9VrCfPkHGFgXcvkAY9FbGU=	uxdstV02nzpfJpAAmnPzRKOeIf458tVe6LQTjEICtsA=	f	2023-11-02 14:22:44.716	2023-11-21 14:22:44.716	2023-10-28 14:22:44.717
clodtfr8c0001lyfil7mi1a5e	clo6q6r0r0000lyedmjryjryy	ICqpTeL9g+Hgm2E2UlIrXTLzIFxRGHXrVYzhLFS22Oo=	1mnM8yOtupMC5fwyMNJN4JL3DzLCDq7agS8urO0ggt0=	f	2023-11-05 04:15:26.363	2023-11-24 04:15:26.364	2023-10-31 04:15:26.365
clodtg4sr0003lyfi50srcoag	clo6q6r0r0000lyedmjryjryy	EJDhNrdKkQv+eXq00AM6eNcoyY02uldfQL5LgAz0s6c=	LwM9ZSNYUWms2tpfN7q668U6cOdhCFnpvtGdf+XDpoo=	f	2023-11-05 04:15:43.947	2023-11-24 04:15:43.947	2023-10-31 04:15:43.948
clodu0bsb0012lyfimra86aub	clo6q6r0r0000lyedmjryjryy	+/3AWPTFYwNK+5FkDhBfVzDvUZGvEiKhAKNXM4IcEbQ=	i6f2LhIviatewmlJDHlxt5co8FUX/vKSifsKwm/5qmQ=	f	2023-11-05 04:31:26.123	2023-11-24 04:31:26.123	2023-10-31 04:31:26.124
clofg63ny004hly7zqq998hgv	clo6q6r0r0000lyedmjryjryy	0adKCV76MES0vNIEvGyBIPYO3Pi3xmRNwx8qGmwgXTk=	10Iwzf715RBkOy8qCP+gfhwHsa4+B09+muW7RORYZjM=	f	2023-11-06 07:39:33.261	2023-11-25 07:39:33.261	2023-11-01 07:39:33.262
clofso4dv004nly7zbgz4hief	clo6q6r0r0000lyedmjryjryy	Bo5smriOlaYx+qNZOWJE6aLqWc92diqDCecCtSeV/6s=	6LN1TSap3eh4gaww1b2SIpOZhP4hcQbnH43uejjsACw=	f	2023-11-06 13:29:29.395	2023-11-25 13:29:29.395	2023-11-01 13:29:29.396
clol6pkwx0002lyiug2drxli5	clol6pkwi0000lyiul5fm7xg9	umGrIsQZSm1R29Nlb5s4moiVsvYsPMlM+m1XelvWw4o=	DYofIQl0kDWZ8wk0+Ng3jViuI8OuYKseYxAeJXehRN0=	f	2023-11-10 08:01:22.976	2023-11-29 08:01:22.976	2023-11-05 08:01:22.977
clol6r3bj0006lyiuffvmkhd3	clo6q6r0r0000lyedmjryjryy	AQeihnYoL8NE/r8Rm9F3NUDpOYIAp21fsJP4pXtWRo4=	m6m8MaKeh/c4Gg1Sa5Sk6L17SJo0tDD8H/s3VCfkDsE=	f	2023-11-10 08:02:33.486	2023-11-29 08:02:33.486	2023-11-05 08:02:33.487
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, fullname, password, access, status, created_at) FROM stdin;
clo6q6r0r0000lyedmjryjryy	mostafagholamidev@gmail.com	Mostafa Gholami	c557dbe7da3b811bdfe942ef65a4878f76d46eb980e6218e10f4166ccd2a082a	admin	active	2023-10-26 05:10:04.107
clol6pkwi0000lyiul5fm7xg9	mostafa@gmail.com	Mostafa New	c557dbe7da3b811bdfe942ef65a4878f76d46eb980e6218e10f4166ccd2a082a	user	active	2023-11-05 08:01:22.962
\.


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words (id, word, meaning, created_at) FROM stdin;
cloa5mklj000mly2svd8bg2qi	have	داشتن	2023-10-28 14:45:35.047
clobd5cve0030lyi8t1kgzu42	more	بیشتر / بیش	2023-10-29 11:03:54.986
clobctdeg002blyi8wd95mc5f	how	چگونه / چطور / طوری که	2023-10-29 10:54:35.8
clobcxvgz002llyi8s8pgiacx	its	مال آن	2023-10-29 10:58:05.843
clobdm7xm003ulyi8yg1oxo6v	also	همچنین	2023-10-29 11:17:01.738
clobdo6jl003zlyi8i21dqgxa	new	جدید	2023-10-29 11:18:33.249
clobdpsre0044lyi8ahwxxvt9	because	چون / زیرا	2023-10-29 11:19:48.698
clobdrok20049lyi8o7zbv3lb	day	روز	2023-10-29 11:21:16.562
clobdtkj5004elyi89xc32k4b	use	استفاده کردن	2023-10-29 11:22:44.657
clobduum9004jlyi8vx5vt2wp	no	نه / خیر / برای منفی کردن	2023-10-29 11:23:44.385
clobdxs4b004olyi8od5cjqjp	man	مرد / انسان	2023-10-29 11:26:01.115
clo6rkghh0005lyi6u8thll6d	be	بودن	2023-10-26 05:48:43.253
cloa4y0sl0002ly2s5sng56qa	and	و	2023-10-28 14:26:29.637
cloa4zjko0007ly2sqfgmdfv7	of	از	2023-10-28 14:27:40.632
cloa5464z000cly2sjkendp78	in	در / داخل	2023-10-28 14:31:16.499
cloa55tkd000hly2sr3sy5jt1	to	به / به سمت / با	2023-10-28 14:32:33.517
cloa5pm51000rly2sjaq71itq	it	آن / اشاره به دور	2023-10-28 14:47:57.014
cloa5sta7000wly2sxop4t2u7	that	که / آن	2023-10-28 14:50:26.24
cloa5xwej0016ly2sj232huq9	you	تو / شما	2023-10-28 14:54:23.563
cloa5z0qz001bly2syj7ztgq8	he	او (مذکر)	2023-10-28 14:55:15.851
cloa61jz0001gly2sk2jznyjh	with	با / همراه با	2023-10-28 14:57:14.077
cloa6312d001lly2snlt6dc7c	on	بر / بر روی / در	2023-10-28 14:58:22.886
cloa64bvq001qly2sds81ctsb	do	انجام دادن / کردن	2023-10-28 14:59:23.559
cloa66bw7001vly2swopbrb5y	say	گفتن / بیان کردن	2023-10-28 15:00:56.888
cloa683zl0020ly2sb9pbhedf	this	این / اشاره به نزدیک	2023-10-28 15:02:19.953
cloa69cyg0025ly2sz8fsztl2	they	آنها	2023-10-28 15:03:18.232
cloa6nukx0000ly6biofk4ixf	at	در / به سوی / به	2023-10-28 15:14:34.257
cloa6pbja0005ly6b9gzmob1a	but	اما / بلکه / مگر / ولی	2023-10-28 15:15:42.887
cloa6r8ae000aly6bicnwvpg3	we	ما	2023-10-28 15:17:11.99
cloa6st1i000fly6b26r0vb5c	his	مال او (مذکر)	2023-10-28 15:18:25.543
cloa6ubly000kly6bs4eneamm	from	از	2023-10-28 15:19:36.263
cloa6w9wm000ply6bzxqxz600	not	نه / برای منفی کردن	2023-10-28 15:21:07.367
cloa6y81z000uly6bsepomkio	by	توسط / به وسیله ی	2023-10-28 15:22:38.279
cloa71j0w000zly6bdsozw6tz	she	او (مونث)	2023-10-28 15:25:12.464
cloa72zgf0014ly6bt3a8hhby	or	یا / چه / خواه	2023-10-28 15:26:20.416
cloa75wrt0019ly6b8t4xds5k	as	مانند / چنانکه / بعنوان	2023-10-28 15:28:36.906
cloa78onv001ely6bs6rsyyr6	what	چه / چه چیزی / آنچه / کدام	2023-10-28 15:30:46.363
cloa7a06z001jly6b2jfpspx5	go	رفتن	2023-10-28 15:31:47.963
cloazvame0000lyokqcxjgdjj	their	مال آنها / خودشان	2023-10-29 04:52:10.502
clob0dy6w000alyokwzzv7zgv	who	چه کسی / کسی که	2023-10-29 05:06:40.856
clob0ga7f000flyokl5i7bd93	get	رسیدن / گرفتن / شدن	2023-10-29 05:08:29.74
clob0i8no000klyokgrwh6w42	if	اگر / آیا	2023-10-29 05:10:01.045
clob0m5ma000plyokzakv75xs	would	تمایل / تمایل داشتن / مایل بودن	2023-10-29 05:13:03.73
clob0p7nl000ulyoklhc4otge	her	مال او (مونث)	2023-10-29 05:15:26.337
clob0qgwd000zlyokwxu9mpyo	all	همه  / تمامی	2023-10-29 05:16:24.973
clob0s6p60014lyokl5rmg2ru	my	مال من	2023-10-29 05:17:45.066
clob0uokq0019lyokw54q6nvb	make	ساختن / درست کردن	2023-10-29 05:19:41.546
clob0wtoi001elyokcf6v7ywa	about	درباره / در مورد / حدود	2023-10-29 05:21:21.474
clob0yizr001jlyokzogwg3i2	know	دانستن / آگاهی داشتن	2023-10-29 05:22:40.936
clob10idn001olyok1aq56hnl	will	اراده / خواسته / برای بیان زمان آینده	2023-10-29 05:24:13.452
clob123z5001tlyok13afgc9r	up	بالا	2023-10-29 05:25:28.098
clob15gli001ylyok1p6utz7e	one	عدد یک / یکی	2023-10-29 05:28:04.422
clob16z360023lyokmnd1gr5s	time	زمان / وقت	2023-10-29 05:29:15.043
clob18co20028lyokc7w0ecja	there	آنجا / اشاره به جایی	2023-10-29 05:30:19.298
clob1dlzo002dlyokhcmg5h3o	year	سال	2023-10-29 05:34:24.66
clob1fc1a002ilyokew61qkt4	so	پس / بنابراین / این چنین	2023-10-29 05:35:45.07
clob1hxma002nlyok7f8aq2tw	think	فکر کردن	2023-10-29 05:37:46.354
clob1jn5w002slyoklvlyj0hp	when	چه وقت / وقتی که / زمانی که	2023-10-29 05:39:06.116
clob1mh4c002xlyok5vv720t0	which	کدام / چه / آنچه	2023-10-29 05:41:18.253
clob95iff0000lyi8siaec767	them	آنها را / به آنها	2023-10-29 09:12:03.723
clob99eld0005lyi8swxdrvkf	some	مقداری / کمی / برخی	2023-10-29 09:15:05.377
clob9buei000alyi83xjlht9v	me	به من / مرا	2023-10-29 09:16:59.178
clob9dcoz000dlyi8mqjwezsy	people	مردم / افراد	2023-10-29 09:18:09.54
clob9fbqs000ilyi8m87k5iqq	take	گرفتن / برداشتن / بردن	2023-10-29 09:19:41.62
clob9n1q6000nlyi8w831trpk	out	خارج / بیرون	2023-10-29 09:25:41.887
clob9pdhl000slyi8owt34z4z	into	داخل / توی	2023-10-29 09:27:30.441
clob9u7ty0012lyi8pgqncy7m	see	دیدن	2023-10-29 09:31:16.39
clob9wjr00017lyi857ytk5ed	him	او را / به او / از او	2023-10-29 09:33:05.148
clobby5va001clyi84zxumtn1	your	مال تو	2023-10-29 10:30:19.703
clobbzqwl001hlyi8zhxbuj9f	come	آمدن	2023-10-29 10:31:33.621
clobc4r6i001mlyi8ypx6t74c	could	توانستن	2023-10-29 10:35:27.258
clobc7k3f001rlyi8ubyqm0du	now	اکنون / الان / حالا	2023-10-29 10:37:38.043
clobc9cj8001wlyi8azswd001	than	نسبت به / تا اینکه / از	2023-10-29 10:39:01.556
clobcb95p0021lyi8of192bqe	like	مانند بودن / خوش آمدن	2023-10-29 10:40:30.494
clobcoqej0026lyi85j88y1ty	other	دیگر / دیگری / غیر	2023-10-29 10:50:59.372
clobcv91v002glyi8za7wkkxy	then	سپس / بعد / آنگاه	2023-10-29 10:56:03.475
clobd1wuq002qlyi8ohutrhlk	our	مال ما	2023-10-29 11:01:14.259
clobd3m48002vlyi847jr09az	two	عدد دو	2023-10-29 11:02:33.656
clobd7cso0035lyi8kw3pl9ik	these	اینها	2023-10-29 11:05:28.201
clobdbtxl003alyi8sy5jd7lj	want	خواستن	2023-10-29 11:08:57.034
clobdewwj003flyi8ip862k19	way	راه / روش	2023-10-29 11:11:20.851
clobdi6p3003klyi8mf3wb53w	look	نگاه کردن	2023-10-29 11:13:53.511
clobdkj0d003plyi8kz5m2z2z	first	اول / اولین	2023-10-29 11:15:42.782
clobdz9n4004tlyi87b0sg2h6	here	اینجا	2023-10-29 11:27:10.481
clobe1wkj004ylyi84ot7z305	thing	چیز	2023-10-29 11:29:13.507
clobe406k0053lyi8fyoakw7f	give	دادن	2023-10-29 11:30:51.501
clobe5m150058lyi8zlrbtv3x	many	بسیار / زیاد	2023-10-29 11:32:06.473
clobe73ea005dlyi8qtfo0hm5	well	خوب / به خوبی	2023-10-29 11:33:15.635
clobeabs0005ilyi8vkl00xhm	only	فقط / تنها	2023-10-29 11:35:46.464
clobecjej005nlyi8dz80hsmg	those	آنها / اشاره به دور	2023-10-29 11:37:29.66
clobeed4s005slyi8xyxx3n83	tell	گفتن	2023-10-29 11:38:54.844
clobefwdf005xlyi89dtz2zl0	very	بسیار / خیلی	2023-10-29 11:40:06.436
clobehcji0062lyi84vrg8uxi	even	حتی / عدد زوج	2023-10-29 11:41:14.047
clobekdce0067lyi8npbsplv2	back	پشت / عقب	2023-10-29 11:43:35.055
clobem58d006clyi86gyu8770	any	هر / هیچ	2023-10-29 11:44:57.854
clobf1mcl006hlyi8wmpd1v0x	good	خوب / خوبی	2023-10-29 11:56:59.878
clobf2oya006mlyi8ejigbodo	woman	زن / خانم	2023-10-29 11:57:49.907
clobf4ui3006rlyi8pap9c7br	through	از طریق / از میان	2023-10-29 11:59:30.411
clobf76u6006wlyi8qz02ennm	us	ما را / به ما	2023-10-29 12:01:19.71
clobf9fu80071lyi8vzgw5pk5	life	زندگی / عمر / جان	2023-10-29 12:03:04.688
clobfb1uk0076lyi8gh1pctzm	child	کودک / بچه	2023-10-29 12:04:19.869
clobfcuto007blyi8z54ks0du	ward	کار / کار کردن	2023-10-29 12:05:44.077
clobfebr2007glyi8oiay114z	down	پایین / غمگین	2023-10-29 12:06:52.67
clobfh32u007llyi88mhy1403	may	ممکن بودن / ماه می	2023-10-29 12:09:01.399
clobfilcj007qlyi85qlj1zhe	after	پس از / بعد از	2023-10-29 12:10:11.731
clobfkoyf007vlyi8y6mnxr0c	should	باید	2023-10-29 12:11:49.719
clobfly190080lyi86lzx07ui	call	صدا زدن / زنگ زدن / نامیدن	2023-10-29 12:12:48.142
clobfn0760085lyi8ihuvzjn0	world	جهان / دنیا	2023-10-29 12:13:37.603
clobfpks5008alyi8eihxajkv	over	روی / بالای / بیش از	2023-10-29 12:15:37.589
clobfvdzf008flyi8xp4u9wz6	school	مدرسه	2023-10-29 12:20:08.715
clobfx9f5008klyi829wa2rf2	Still	هنوز / ساکن	2023-10-29 12:21:36.113
clobfyke1008plyi8odh9f3q2	try	امتحان کردن / سعی کردن	2023-10-29 12:22:36.986
clobg0536008ulyi8z14izmyz	last	آخر / آخرین / گذشته	2023-10-29 12:23:50.466
clobg1ox2008zlyi8zflh4kmz	ask	پرسیدن / درخواست کردن	2023-10-29 12:25:02.822
clobg36gc0094lyi84tktvzsc	need	نیاز / نیاز داشتن	2023-10-29 12:26:12.205
clobg513h0099lyi8xj5dt46u	too	همینطور / همچنین / زیاد	2023-10-29 12:27:38.573
clobg6d4a009elyi8a1jt76wh	feel	احساس کردن / حس کردن	2023-10-29 12:28:40.81
clobg88rb009jlyi8m72qlodn	three	عدد سه	2023-10-29 12:30:08.471
clobg9q5a009olyi8srm1fre9	state	حالت / دولت / ایالت / وضعیت	2023-10-29 12:31:17.663
clobgbcoy009tlyi8gi8rg321	never	هرگز	2023-10-29 12:32:33.538
clobgchkg009ylyi8uq2eo018	become	شدن / مناسب بودن	2023-10-29 12:33:26.512
clobgdpi800a3lyi8ybxhaq0x	between	میان / در بین	2023-10-29 12:34:23.456
clobgftlt00a8lyi8cbuz8fyt	high	زیاد / بالا	2023-10-29 12:36:02.081
clobgihhj00adlyi8ol7muvea	really	واقعا	2023-10-29 12:38:06.343
clobgl07l00ailyi8n80fzvbx	something	چیزی	2023-10-29 12:40:03.922
clobgmi3w00anlyi8c8vmx0pk	most	بیشتر / اکثر	2023-10-29 12:41:13.772
clobgnq0k00aslyi8xtbz25cx	another	دیگر / دیگری / سایر	2023-10-29 12:42:10.677
clobgpfn100axlyi8h7p32aqe	own	خود / شخصی	2023-10-29 12:43:30.541
clobgqrhx00b2lyi8c7f29hx9	leave	مرخصی / ترک کردن / رها کردن	2023-10-29 12:44:32.565
clobgu5i700b7lyi8fq2ip9de	put	قرار دادن / گذاشتن	2023-10-29 12:47:10.687
clobgvu1j00bclyi8ya2yef8i	old	سن / پیر / قدیمی	2023-10-29 12:48:29.144
clobgx8hg00bhlyi8z5wllln5	while	در حین / در مدت	2023-10-29 12:49:34.517
clobgz16800bmlyi8zt9bhm1c	mean	معنی دادن / منظور داشتن	2023-10-29 12:50:58.353
clobh12qu00brlyi8b6d01htj	keep	نگاه داشتن / حفظ کردن چیزی	2023-10-29 12:52:33.703
clobh25ka00bwlyi8r0482xib	student	دانش آموز / دانشجو	2023-10-29 12:53:24.01
clobh3dqa00c1lyi8n3godv76	why	چرا / چرا که	2023-10-29 12:54:21.251
clobhv1870000lymvhhxxjv0f	let	اجازه دادن	2023-10-29 13:15:51.416
clobhwd9i0005lymvpkl58war	great	بزرگ / عظیم / عالی	2023-10-29 13:16:53.671
clobhxzam000alymvxdzix73a	same	یکسان / مثل هم	2023-10-29 13:18:08.878
clobhzie0000flymvitye95lz	big	بزرگ	2023-10-29 13:19:20.28
clobi0uy6000klymvab0kib1i	group	گروه	2023-10-29 13:20:23.214
clobi8htr000plymvjz9rpeth	begin	شروع شدن / شروع کردن	2023-10-29 13:26:19.455
clo6rjb220002lyi6gan1si63	the	حرف تعریف	2023-10-26 05:47:49.562
cloa5vbjd0011ly2sinj5t1dn	for	برای / به منظوره	2023-10-28 14:52:23.21
cloazxgr60005lyok3apwfni2	can	توانستن / قادر بودن	2023-10-29 04:53:51.762
clob9s2p3000xlyi8ypmromrp	just	فقط / تنها / به تازگی	2023-10-29 09:29:36.424
clocdndim0000lyj1nuzn5322	seem	به نظر رسیدن / به نظر آمدن	2023-10-30 04:05:41.806
clocdp1ni0005lyj1t70rkub5	country	کشور / خارج از شهر	2023-10-30 04:06:59.743
clocdrpzv000alyj1iod7bufz	help	کمک / کمک کردن	2023-10-30 04:09:04.604
clocdtiji000flyj11xyfbhmb	talk	صحبت کردن / حرف زدن	2023-10-30 04:10:28.255
clocduz5r000klyj1sya7r786	where	کجا / جایی که	2023-10-30 04:11:36.448
clocdwffr000plyj1opffg2ag	turn	نوبت / پیچیدن / دور زدن	2023-10-30 04:12:44.199
clocdyvf3000ulyj1k3nn00y8	problem	مشکل / مسئله	2023-10-30 04:14:38.224
cloce1jpt000zlyj18m71fq7i	every	هر	2023-10-30 04:16:43.025
cloce38bb0014lyj16b3ysg2e	start	شروع / شروع کردن	2023-10-30 04:18:01.559
cloce547c0019lyj1cewu6bvy	hand	دست	2023-10-30 04:19:29.544
cloce6k0v001elyj1lq00a7ql	might	ممکن بودن / توانایی	2023-10-30 04:20:36.703
cloce90om001jlyj12xkey8h1	American	آمریکایی	2023-10-30 04:22:31.607
cloceaw9j001olyj1scy3chsv	show	نشان دادن / نمایش	2023-10-30 04:23:59.192
clocec5jr001tlyj1a4lrmoie	part	بخش / قسمت / جز	2023-10-30 04:24:57.88
clocg12xz001ylyj1wo3kt89h	against	در برابر / در مقابل / مخالف	2023-10-30 05:12:20.519
clocg3gyu0023lyj1z3x0v5ql	place	محل / مکان / در محل قرار دادن	2023-10-30 05:14:12.006
clocg5s1g0028lyj1457fipng	such	چنین / این چنین	2023-10-30 05:15:59.668
clocg7adg002dlyj1yzpopwxb	again	دوباره / مجدد	2023-10-30 05:17:10.084
clodtn8q30004lyfixzifzaxl	few	کمی / اندک / کم	2023-10-31 04:21:15.627
clodtorws0009lyfi4uh2nm9c	case	مورد / جعبه / پوسته	2023-10-31 04:22:27.149
clodtq1wd000elyfit6ppd60j	week	هفته	2023-10-31 04:23:26.749
clodts23r000jlyfiiw7iwtpm	company	شرکت	2023-10-31 04:25:00.328
clodtujfy000olyfibaimauxi	system	سیستم	2023-10-31 04:26:56.111
clodtwryp000tlyfij8qjn2h1	each	هر / هر یک	2023-10-31 04:28:40.466
clodtyn7t000ylyfipj40e9il	right	صحیح / درست / راست	2023-10-31 04:30:07.625
clodu4aeo0015lyfi370tvzj5	program	برنامه / دستور کار	2023-10-31 04:34:30.961
clodu6ntz001alyfix7r8erpg	hear	شنیدن	2023-10-31 04:36:21.672
clodu8323001flyfi1q4md6mq	question	سوال	2023-10-31 04:37:28.06
clodu974b001klyfigo5e354u	during	در طی / در طول	2023-10-31 04:38:19.979
cloducr5h001plyfiwmq2dnj7	play	بازی / بازی کردن	2023-10-31 04:41:05.909
clodue15l001ulyfijpb55sgy	government	دولت / حکومت	2023-10-31 04:42:05.529
clodufo1i001zlyfilhxydq0d	run	دویدن / اجرا کردن	2023-10-31 04:43:21.846
clodukcgo0024lyfiymjrkvke	small	کوچک / اندک / کم	2023-10-31 04:47:00.12
clodumesp0029lyfigog6cg9h	number	شماره / عدد / شمردن	2023-10-31 04:48:36.458
clodunsxu002elyfihzxfrepn	always	همیشه / همواره	2023-10-31 04:49:41.443
cloduptks002jlyfi2iqll453	move	حرکت کردن / جابجا شدن	2023-10-31 04:51:15.581
clodurl77002olyfibbswbxgv	night	شب	2023-10-31 04:52:38.035
clodut9ur002tlyfiho61tyua	live	زندگی کردن	2023-10-31 04:53:56.643
cloduvhx1002ylyfi9am7tvsg	point	نقطه / محل / نکته	2023-10-31 04:55:40.405
cloduxccd0033lyfi724b6pkt	believe	باور داشتن / اعتقاد داشتن	2023-10-31 04:57:06.493
cloduzd7q0038lyfilvmruzg2	hold	نگه داشتن	2023-10-31 04:58:40.934
clodv1kqt003dlyfibmd0z2hz	today	امروز	2023-10-31 05:00:24.005
clodv2jkq003ilyfi9xkcajvk	large	بزرگ / وسیع	2023-10-31 05:01:09.147
clodv3gre003nlyfi1p6sc92x	million	میلیون	2023-10-31 05:01:52.154
clodv7bqz003slyfiiezt3wle	must	باید	2023-10-31 05:04:52.283
clodv8akg003xlyfietsn2k1w	home	خانه	2023-10-31 05:05:37.409
clodv9vt70042lyfismj93aey	under	زیر / تحت	2023-10-31 05:06:51.596
clodvd6oz0047lyfijuhfqdj2	water	آب	2023-10-31 05:09:25.667
clodvfcjp004clyfig0yfns9n	room	اتاق / فضا	2023-10-31 05:11:06.565
clofe7pjl0000ly7z6l1sizxa	write	نوشتن	2023-11-01 06:44:49.041
clofe8web0005ly7z486djwle	mother	مادر	2023-11-01 06:45:44.579
clofe9yxk000aly7zvrg8ya6z	area	ناحیه / منطقه	2023-11-01 06:46:34.52
clofebgmn000fly7zbw24w897	national	ملی	2023-11-01 06:47:44.112
clofed98s000kly7zxcjb6jrw	money	پول	2023-11-01 06:49:07.852
clofeff9p000ply7zbnt5ft1z	story	داستان / ماجرا	2023-11-01 06:50:48.974
clofegq8v000uly7zblesxi7n	young	جوان	2023-11-01 06:51:49.856
clofeikpq000zly7z50szwxoo	fact	حقیقت / واقعیت	2023-11-01 06:53:15.998
clofel4hh0014ly7z98d3zc16	month	ماه	2023-11-01 06:55:14.933
clofempbt0019ly7z61yqdsg5	different	مختلف / متفاوت	2023-11-01 06:56:28.602
clofep05b001ely7zj7n0samz	lot	خیلی / بخش زیاد / قطعه	2023-11-01 06:58:15.935
clofer0xj001jly7zwkb1krvx	study	درس خواندن / مطالعه کردن	2023-11-01 06:59:50.263
clofesj9b001oly7zu0emq8fi	book	کتاب / رزرو کردن	2023-11-01 07:01:00.671
clofeuk6c001tly7zv5511eaz	eye	چشم	2023-11-01 07:02:35.172
clofevou1001yly7z8n6jb982	job	کار / شغل	2023-11-01 07:03:27.865
clofexn530023ly7zog9afoic	word	کلمه / حرف	2023-11-01 07:04:58.983
clofezqll0028ly7z1l0n38wh	though	اگرچه / به هر حال	2023-11-01 07:06:36.777
cloff2cop002dly7zvjt7b6r9	business	تجارت / بیزینس	2023-11-01 07:08:38.714
cloff3tzd002ily7zw1z7bz03	issue	موضوع / مسئله / مشکل	2023-11-01 07:09:47.786
cloff5i55002nly7zsw2473ug	side	سمت / طرف	2023-11-01 07:11:05.754
cloffhxl2002sly7zi89qbgou	kind	نوع / مهربان	2023-11-01 07:20:45.638
cloffjfx9002xly7z543t4z7x	four	عدد ۴	2023-11-01 07:21:56.061
cloffkyeq0032ly7zrvp1c5ap	head	سر / جلو	2023-11-01 07:23:06.674
cloffngg70037ly7z3da1p2bt	far	دور	2023-11-01 07:25:03.368
cloffp2dk003cly7z2plw6nvd	black	سیاه / مشکی	2023-11-01 07:26:18.44
cloffqc7t003hly7zssx5hjrs	long	طولانی / طول	2023-11-01 07:27:17.85
cloffrx5r003mly7zv11wckcx	both	هر دو	2023-11-01 07:28:31.647
cloffu5hb003rly7zfr6lv42x	little	کوچک / کم	2023-11-01 07:30:15.743
cloffvqyp003wly7z5j4udw1h	house	خانه / ساختمان	2023-11-01 07:31:30.241
cloffxwz60041ly7zgg6qg38n	since	از آن موقع / از جایی که	2023-11-01 07:33:11.346
cloffzx0r0046ly7zt9zr49a4	provide	تهیه کردن / فراهم کردن	2023-11-01 07:34:44.715
clofg1trp004bly7zlkadd484	service	سرویس / سرویس کردن	2023-11-01 07:36:13.814
clofspldf004oly7zvxwe699x	around	دور و بر / در اطراف / در حدود	2023-11-01 13:30:38.067
clofsr8s7004tly7ze3a50b01	friend	دوست	2023-11-01 13:31:55.063
clofsvdf0004yly7zcohn62s1	important	مهم	2023-11-01 13:35:07.693
clofswgnj0053ly7zqb5uh9hq	father	پدر	2023-11-01 13:35:58.543
cloft79vx0058ly7zwctd969o	sit	نشستن	2023-11-01 13:44:22.989
cloft8y2g005dly7zpi9u760e	away	دور / دور از	2023-11-01 13:45:40.985
cloftak0p005ily7zhovc3xlo	until	تا / تا وقتی که	2023-11-01 13:46:56.09
cloftc00q005nly7zbgui8pvt	power	قدرت / نیرو / توان	2023-11-01 13:48:03.482
cloftgap9005sly7zjacbjzke	hour	ساعت	2023-11-01 13:51:23.95
cloftnp0q005xly7zks69f8sw	game	بازی	2023-11-01 13:57:09.099
cloftpb470062ly7zzf6wq4jy	often	اغلب / غالباً / بیشتر وقت‌ها	2023-11-01 13:58:24.391
cloftr8670067ly7z11533dkj	yet	با وجود اینکه / هنوز / با اینکه	2023-11-01 13:59:53.887
cloftv48q006cly7ze9c34zb8	line	خط / صف	2023-11-01 14:02:55.418
cloftxt8t006hly7zyoik5o2p	political	سیاسی	2023-11-01 14:05:01.134
clofu1avn006mly7z19zxkzku	end	پایان / انتها / پایان دادن	2023-11-01 14:07:43.956
clofu7cxq006rly7zlsqqavpq	among	در میان / در بین	2023-11-01 14:12:26.559
clofub7f4006wly7zefy1bbe6	ever	همیشه / تا به حال	2023-11-01 14:15:26.032
clofucij00071ly7zq2b7fjq3	stand	ایستادن	2023-11-01 14:16:27.084
clofue4h80076ly7zr9rq9xq3	bad	بد / اشتباه	2023-11-01 14:17:42.188
clofug35v007bly7zc80l0p86	lose	باختن / از دست دادن	2023-11-01 14:19:13.795
clofun459007gly7zc72toewh	however	به هر حال / به هر صورت	2023-11-01 14:24:41.661
clofuqlim007lly7zamut8j6w	member	عضو	2023-11-01 14:27:24.142
clofurzpt007qly7zc6ddz13b	pay	پرداخت کردن	2023-11-01 14:28:29.202
clofuucb6007vly7zlpp4dvb0	low	قانون	2023-11-01 14:30:18.834
clofuvxs90080ly7zjytdauhn	meet	ملاقات کردن / دیدار کردن	2023-11-01 14:31:33.322
clofux9si0085ly7z88zkx6hs	car	ماشین / خودرو	2023-11-01 14:32:35.539
clofuyl56008aly7z3xsihz38	city	شهر	2023-11-01 14:33:36.906
clofv050m008fly7zvw16joo1	almost	تقریبا	2023-11-01 14:34:49.319
clofv102v008kly7zrrycgld3	include	شامل بودن / عبارت بودن از	2023-11-01 14:35:29.575
clofv2mp3008ply7z6iffiuy7	continue	ادامه دادن	2023-11-01 14:36:45.543
clogp82eh0000lyivzz0sa6ym	set	مجموعه / تنظیم کردن / چیدن	2023-11-02 04:40:47.658
clogpacw90005lyiv55aoh9o2	later	بعداً / بعد / سپس	2023-11-02 04:42:34.57
clogpbzop000alyivm7c79kgr	community	انجمن / جامعه	2023-11-02 04:43:50.761
clogpe1vt000flyivcl58lqdk	name	اسم / نام / نامیدن	2023-11-02 04:45:26.921
clogpffsx000klyivjq4l8gv4	five	عدد ۵	2023-11-02 04:46:31.618
clogpgv5s000plyivwma72shv	once	یک بار / یک وقتی	2023-11-02 04:47:38.176
clogpi1vp000ulyiv5os4k9ri	White	سفید	2023-11-02 04:48:33.541
clogpkaa0000zlyivrn9avkl9	least	کمترین	2023-11-02 04:50:17.737
clogpmntb0014lyivqpy38nh0	president	رئیس جمهور / رئیس	2023-11-02 04:52:08.591
clogpns9z0019lyiv1qatweyk	learn	یاد گرفتن / آموختن	2023-11-02 04:53:01.031
cloh3aqd2001elyivxiw7rnys	real	واقعی / اصل	2023-11-02 11:14:46.646
cloh3cspg001jlyivklven5gr	change	تغییر / تغییر دادن	2023-11-02 11:16:22.997
cloh3dvjn001olyiv8kt5svx6	team	تیم	2023-11-02 11:17:13.331
cloh3fi80001tlyivtjkwx6pe	minute	دقیقه	2023-11-02 11:18:29.376
cloh3lwde001ylyivugqwh0dv	best	بهترین	2023-11-02 11:23:27.65
cloh3nwdc0023lyiv8bahv9em	several	چند / چندین	2023-11-02 11:25:00.96
cloh3qcc80028lyivagmgdahf	idea	فکر / ایده / دیدگاه	2023-11-02 11:26:54.969
cloh3u63u002dlyivo5nmki0k	body	بدن / بدنه	2023-11-02 11:29:53.514
cloh3xbjf002ilyiv3h7ik1eb	kid	بچه / کودک / شوخی کردن	2023-11-02 11:32:20.523
cloh3y97y002nlyivuja5v03y	information	اطلاعات	2023-11-02 11:33:04.174
cloh40p5w002slyiv1c7h7eig	nothing	هیچ / هیچ چیز	2023-11-02 11:34:58.148
cloh427kk002xlyivppeazoa4	ago	پیش / قبل	2023-11-02 11:36:08.661
cloh43oo50032lyiv21z1kjbz	lead	رهبری کردن / منجر شدن	2023-11-02 11:37:17.477
cloh45sia0037lyivcx10qgtj	social	اجتماعی	2023-11-02 11:38:55.762
cloh476bh003clyivz99xy6gk	understand	فهمیدن / متوجه شدن / درک کردن	2023-11-02 11:40:00.318
cloh4c37z003hlyivlwoapde7	whether	چه / خواه / آیا	2023-11-02 11:43:49.584
cloh4ejaw003mlyivo1z7ba64	watch	تماشا کردن / ساعت / مراقب بودن	2023-11-02 11:45:43.737
cloh4gfih003rlyiv8lxukg2i	together	با هم / با همدیگر	2023-11-02 11:47:12.138
cloh4hkde003wlyiv79mga7fh	follow	دنبال کردن	2023-11-02 11:48:05.09
cloh4ikg90041lyivo2u96vri	parents	والدین / پدر و مادر	2023-11-02 11:48:51.849
cloh4jzki0046lyivjwrcjcai	stop	توقف کردن / متوقف کردن	2023-11-02 11:49:58.098
cloh4ldde004blyivlp2sc77v	face	صورت / چهره / مواجه شدن	2023-11-02 11:51:02.642
cloh4mkfp004glyivnb7x2bzy	anything	هر چیزی / هیچ چیزی	2023-11-02 11:51:58.454
cloh4nwiy004llyivhgjej9nj	create	ساختن / ایجاد کردن / خلق کردن	2023-11-02 11:53:00.779
cloh4p2kq004qlyiv7slit7n0	public	عمومی	2023-11-02 11:53:55.275
cloh4qmce004vlyivrjcxrot3	already	در حال حاضر / تاکنون / هم اکنون	2023-11-02 11:55:07.55
cloh4s9nj0050lyivxd0j9vb3	speak	صحبت کردن	2023-11-02 11:56:24.415
cloh4u7d20055lyivy236vati	others	دیگران	2023-11-02 11:57:54.758
cloh5g4jo005alyivd6ja5fnh	read	خواندن	2023-11-02 12:14:57.541
cloh5i220005flyivq3d74ayk	level	سطح / پایه	2023-11-02 12:16:27.624
cloh5k48q005klyiv9z985qnn	allow	اجازه دادن	2023-11-02 12:18:03.771
cloh5ld71005plyivupmtms2h	add	اضافه کردن	2023-11-02 12:19:02.029
cloh5njtm005ulyiv8wgsz8pt	office	دفتر / اداره	2023-11-02 12:20:43.931
cloh5pcc3005zlyive76ahf7a	spend	صرف کردن / خرج کردن / گذراندن	2023-11-02 12:22:07.54
cloh5qebw0064lyiv0gykoa9s	door	در / درب	2023-11-02 12:22:56.78
cloh5sdrt0069lyivly6gieeb	health	سلامت / سلامتی	2023-11-02 12:24:29.369
cloh5td5p006elyiv3gz15nz8	person	شخص / فرد	2023-11-02 12:25:15.23
cloh5ufkv006jlyiv6jl91s81	art	هنر	2023-11-02 12:26:05.023
cloh5vxtg006olyiv7k6w2xmk	sure	مطمئن بودن	2023-11-02 12:27:15.316
cloh5x3nj006tlyivvymsblew	war	جنگ	2023-11-02 12:28:09.536
clokcv2h30000lysmat6s89af	history	تاریخ / تاریخچه / سابقه	2023-11-04 18:05:50.535
clokcxhqj0005lysmq00tin5r	party	حزب / مهمانی / جشن	2023-11-04 18:07:43.627
clokcz3r0000alysm2ls47kc5	within	در داخل / در درون / در ظرف	2023-11-04 18:08:58.812
clokd2fr5000flysmbigter8t	grow	رشد کردن / بزرگ شدن	2023-11-04 18:11:34.337
clokd3ob1000klysme3butslu	result	نتیجه / حاصل	2023-11-04 18:12:32.077
clokd5cgu000plysmjfr93n9y	open	باز / باز کردن	2023-11-04 18:13:50.047
clokd6mdu000ulysmz6zvg7jy	morning	صبح	2023-11-04 18:14:49.555
clokd7vac000zlysmbq9anewi	reason	دلیل / علت / سبب	2023-11-04 18:15:47.748
clokd9f8u0014lysmvyilsjrz	low	کم / اندک / پایین	2023-11-04 18:17:00.271
clokdb5vm0019lysmum1vm3y3	win	پیروزی / برنده شدن	2023-11-04 18:18:21.443
clokdc92k001elysm84bzc98i	research	پژوهش / تحقیق	2023-11-04 18:19:12.237
clokddsik001jlysmg8di2pp9	girl	دختر	2023-11-04 18:20:24.093
clokdfmob001olysmzp7guo33	guy	مرد / رفیق	2023-11-04 18:21:49.835
clokdgorc001tlysmegtpn9f2	early	در اوایل / زود	2023-11-04 18:22:39.192
clokdi6iu001ylysm9a9sbuec	food	غذا / خوراک	2023-11-04 18:23:48.87
clokdj4z90023lysmdvwn3ba3	moment	لحظه / هنگام	2023-11-04 18:24:33.525
clokdk9es0028lysmp1wannw7	himself	خودش (مذکر)	2023-11-04 18:25:25.925
clokdm96l002dlysmmc5l8rox	air	هوا	2023-11-04 18:26:58.942
clokdnmdu002ilysm5nwbljgt	teacher	معلم	2023-11-04 18:28:02.707
clokdosqj002nlysmzme6xowd	Force	نیرو / مجبور کردن	2023-11-04 18:28:57.595
clokdqccc002slysmdypn8o74	offer	پیشنهاد / پیشنهاد دادن	2023-11-04 18:30:09.661
clokdrnfx002xlysm03ikfwem	enough	کافی / اندازه	2023-11-04 18:31:10.701
clokdt8cd0032lysm0u5zizr1	education	آموزش / پرورش	2023-11-04 18:32:24.446
clokdujl20037lysm15lqf18e	across	در میان / در طول / روبرو	2023-11-04 18:33:25.671
clokdwi1k003clysmlta3zo0v	although	اگرچه / با این وجود	2023-11-04 18:34:56.985
cloke0kqo003hlysmygf306e3	remember	به یاد داشتن	2023-11-04 18:38:07.105
clokvscef0000lyr7ge7m8cq3	foot	پا	2023-11-05 02:55:36.136
clokvu87g0005lyr7v20x9ayt	second	دوم / دومین / ثانیه	2023-11-05 02:57:04.013
clokvvf2i000alyr72qi1ikps	boy	پسر	2023-11-05 02:57:59.562
clokvwi3q000flyr780etrgbx	maybe	شاید / ممکن است	2023-11-05 02:58:50.15
clokwerry0004ly61qdn976sc	toward	نسبت به / به سمت	2023-11-05 03:13:02.494
clokwgxjf0009ly61x7m0deon	able	قادر / توانا بودن	2023-11-05 03:14:43.276
clokwj5ke000ely61sj8py7ds	age	سن	2023-11-05 03:16:26.99
clokwkfad000jly61jlflqf2g	policy	سیاست	2023-11-05 03:17:26.245
clokwmp8i000oly61zyshix9m	everything	همه چیز / هر چیزی	2023-11-05 03:19:12.45
clokwnlo5000tly61mwis3mrc	love	دوست داشتن	2023-11-05 03:19:54.486
clokwt5p9000yly61m3xf43pk	process	روند / پردازش کردن	2023-11-05 03:24:13.726
clokwug790013ly61rjvv71w0	music	موزیک / موسیقی	2023-11-05 03:25:13.99
clokwwal10018ly61fak2x9d4	including	شامل / از جمله / همراه با	2023-11-05 03:26:40.022
clomwtp7s0005lyxsc8k1jnnf	consider	در نظر گرفتن	2023-11-06 13:00:11.369
clomwwgpa000alyxstmtrjeif	appear	ظاهر شدن / به چشم آمدن / مشخص شدن	2023-11-06 13:02:20.302
clomwyohx000flyxsvmoeiq6l	actually	در واقع / در حقیقت	2023-11-06 13:04:03.718
clomwzoxp000klyxs0p7cmxcf	buy	خریدن	2023-11-06 13:04:50.942
clomx0pl7000plyxs50zw5nvg	probably	شاید / احتمالاً	2023-11-06 13:05:38.443
clomx1qoa000ulyxs6two2ffz	human	انسان / بشر	2023-11-06 13:06:26.506
clomx3s0l000zlyxs0zl01sa2	wait	صبر کردن	2023-11-06 13:08:01.557
clomx5p780014lyxsoz0v74ok	serve	خدمت / خدمت کردن / سرو شدن	2023-11-06 13:09:31.22
clomx7lcu0019lyxs0riv23aj	market	بازار / داد و ستد / مارکت	2023-11-06 13:10:59.55
clomx8qxs001elyxsjo9yv6ul	die	مردن	2023-11-06 13:11:53.44
clomxaza6001jlyxs6d0hdsb3	send	فرستادن	2023-11-06 13:13:37.566
clomy49si001olyxs35fdhqog	expect	انتظار داشتم	2023-11-06 13:36:24.211
clomy68tl001tlyxs015t90jv	sense	حس / حس کردن	2023-11-06 13:37:56.265
clomy8qqs001ylyxs7c5rooaq	build	ساختن / بنا کردن	2023-11-06 13:39:52.805
clomyacua0023lyxsig6mtfh2	stay	ماندن	2023-11-06 13:41:08.098
clomyci1t0028lyxswchpa9si	fall	پاییز / سقوط کردن / افتادن	2023-11-06 13:42:48.161
clomye9jw002dlyxsbdeo9u1b	nation	قوم / ملت	2023-11-06 13:44:10.461
clomyjllo002ilyxskz7g6bd5	plan	طرح / پلن / برنامه چیدن	2023-11-06 13:48:19.357
clomyleke002nlyxsto5ff7fy	cut	بریدن / قطع کردن	2023-11-06 13:49:43.551
clomymwjt002slyxsu9m4i3im	college	کالج / دانشکده	2023-11-06 13:50:53.513
clomyodej002xlyxsn4zwgzob	interest	علاقه / علاقه‌مند کردن	2023-11-06 13:52:02.011
clomys02i0032lyxsd5ifc5hp	death	مرگ	2023-11-06 13:54:51.355
clomytmgw0037lyxsfafmxfbb	course	دوره / درس	2023-11-06 13:56:07.04
clomyuwck003clyxs1zleqh94	someone	کسی / فردی	2023-11-06 13:57:06.501
clomywhko003hlyxsk2q7uj5s	experience	تجربه / تجربه کردن	2023-11-06 13:58:20.664
clomyxyli003mlyxsn88iccu4	behind	پشت / پشت سر	2023-11-06 13:59:29.382
clomyz41v003rlyxs8hfstrei	reach	دست یافتن / رسیدن به	2023-11-06 14:00:23.108
clomz0liv003wlyxscn6tztnx	local	محلی	2023-11-06 14:01:32.407
clomz24880041lyxs2qp3xzzw	kill	کشتن / از بین بردن	2023-11-06 14:02:43.305
clomz576z0046lyxs1156vry9	six	عدد ۶	2023-11-06 14:05:07.115
clomz68qu004blyxskbxa13bi	remain	ماندن / باقی ماندن	2023-11-06 14:05:55.782
clomz8l3h004glyxsu2699zcn	effect	اثر / تاثیر	2023-11-06 14:07:45.102
clomz9ox4004llyxsv60icmc0	suggest	پیشنهاد دادن	2023-11-06 14:08:36.713
clomzamqg004qlyxsqjmzyk32	class	کلاس	2023-11-06 14:09:20.536
clomzcike004vlyxsa1oxh80g	control	کنترل / کنترل کردن	2023-11-06 14:10:48.446
clomzduni0050lyxsedshke0o	raise	بالا بردن / ترفیع	2023-11-06 14:11:50.766
clomzfblb0055lyxs7xxgvpyr	care	مراقبت کردن / اهمیت دادن	2023-11-06 14:12:59.375
clomzgnuv005alyxs1j1iv595	perhaps	شاید / احتمالاً	2023-11-06 14:14:01.928
\.


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: lightner lightner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lightner
    ADD CONSTRAINT lightner_pkey PRIMARY KEY (id);


--
-- Name: phrases phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: words words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- Name: lightner_user_id_word_id_phrase_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX lightner_user_id_word_id_phrase_id_key ON public.lightner USING btree (user_id, word_id, phrase_id);


--
-- Name: tokens_r_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tokens_r_token_key ON public.tokens USING btree (r_token);


--
-- Name: tokens_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tokens_token_key ON public.tokens USING btree (token);


--
-- Name: lightner lightner_phrase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lightner
    ADD CONSTRAINT lightner_phrase_id_fkey FOREIGN KEY (phrase_id) REFERENCES public.phrases(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: lightner lightner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lightner
    ADD CONSTRAINT lightner_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lightner lightner_word_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lightner
    ADD CONSTRAINT lightner_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.words(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: phrases phrases_word_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.words(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tokens tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

