{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    castore = buildMix rec {
      name = "castore";
      version = "0.1.12";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1c5lq5zf66h10g39ca80dk2js195vm6as53jcbylzv48ix97j74q";
      };

      beamDeps = [];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1slp20z2fgcq9p2bbdp1gj218kjqpx5jsa95sq40nq7qqv0yziva";
      };

      beamDeps = [];
    };

    connection = buildMix rec {
      name = "connection";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1746n8ba11amp1xhwzp38yfii2h051za8ndxlwdykyqqljq1wb3j";
      };

      beamDeps = [];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.9.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1phv0a1zbgk7imfgcm0dlacm7hbjcdygb0pqmx4s26jf9f9rywic";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1pn90is3k9dq64wbijvzkqb6ldfqvwiqi7ymc8dx6ra5xv0vm63x";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.11.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1ac6pj3x4vdbsa8hvmbzpdfc4k0v1p102jbd39snai8wnah9sgib";
      };

      beamDeps = [];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.4.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "000zl3y8xw1bhgj47mm4qznyqm24iiflxmlak8d7i6arxhkd4dpa";
      };

      beamDeps = [ connection telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0xzm8hfhn8q02rmg8cpgs68n5jz61wvqg7bxww9i1a6yanf6wril";
      };

      beamDeps = [];
    };

    earmark = buildMix rec {
      name = "earmark";
      version = "1.4.16";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "06443g948lyxx149fwm9nz3bvp595d9cl3a34dly1ghhmvvm7y26";
      };

      beamDeps = [ earmark_parser ];
    };

    earmark_parser = buildMix rec {
      name = "earmark_parser";
      version = "1.4.16";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1bffmjpbmmi1hkvcwc0n5n5na43h082y7qqjs16jfnlg2sbgdz39";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.7.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0f463fw0mydnk7vsy7rinsly85lpbn3f3nylzx66b7j7zhwmnvnk";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.7.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "108w80dax7h043x079gkycsbmc5k3a4ig1n8lnmn8bz95hpa6hib";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    esbuild = buildMix rec {
      name = "esbuild";
      version = "0.3.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1gq7ddfvqyjz5rhf3f6jx6hpqprcqvazc96vb1faaww356lhr1kg";
      };

      beamDeps = [ castore ];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "0.2.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1p0myxmnjjds8bbg69dd6fvhk8q3n7lb78zd4qvmjajnzgdmw6a1";
      };

      beamDeps = [];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.32.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1ggcxk3kkpmmd2sar2scj09lha1c6ziba9j8db1332gxw7592nhw";
      };

      beamDeps = [ html_entities ];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.18.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1igmn69xzj5wpkblg3k9v7wa2fjc2j0cncwx0grk1pag7nqkgxgr";
      };

      beamDeps = [];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.18.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0pjwbf87nqj2ki3i076whrswh2cdhklj6cbaikdj1mq40xidmz4s";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    html_entities = buildMix rec {
      name = "html_entities";
      version = "0.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1k7xyj0q38ms3n5hbn782pa6w1vgd6biwlxr4db6319l828a6fy5";
      };

      beamDeps = [];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1sjcjibl34sprpf1dgdmzfww24xlyy34lpj7mhcys4j4i6vnwdwj";
      };

      beamDeps = [ unicode_util_compat ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0y91s7q8zlfqd037c1mhqdhrvrf60l4ax7lzya1y33h5y3sji8hq";
      };

      beamDeps = [ decimal ];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "05lz15piphyhvvm3d1ldjyw0zsrvz50d2m5f2q3s8x2gvkfrmc39";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0hl901ih14fzxbskibd1q7k9lwqsmihq5b40cbxybp5fs8hbk1ks";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.2.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08wkw73dy449n68ssrkz57gikfzqk3vfnf264s31jn5aa1b5hy7j";
      };

      beamDeps = [];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.3.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12w8ai6b5s6b4hnvkav7hwxd846zdd74r32f84nkcmjzi1vrbk87";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.6.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0cwi5x5rla8cys2yas6i7gk8i9qf46g1hzwv4ay3l35fmisy9gkv";
      };

      beamDeps = [ jason phoenix_pubsub phoenix_view plug plug_cowboy plug_crypto telemetry ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1h9wnjmxns8y8dsr0r41ks66gscaqm7ivk4gsh5y07nkiralx1h9";
      };

      beamDeps = [ ecto phoenix_html plug ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "3.0.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "12zwbr45hx570k1h7fw8a8glnw076ms3w1ql863yvchmz0ygs5yf";
      };

      beamDeps = [ plug ];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.5.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0xif5xp87yb9zwa6frqymry0z477ln885xrshm2vc68wysqn4vp3";
      };

      beamDeps = [ ecto phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.3.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1b5blinpmzdgspgk0dsy01bfjwwnhikb1gfiwnx8smazdrkrcrvn";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "0.16.4";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "185v8dz3kf0ifyqvlmlq1fdzcbdp7v4r450m9zyilq78lada8jvm";
      };

      beamDeps = [ jason phoenix phoenix_html telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0wgpa19l6xar0k2m117iz2kq3cw433llp07sqswpf5969y698bf5";
      };

      beamDeps = [];
    };

    phoenix_view = buildMix rec {
      name = "phoenix_view";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "036v4lq2b55df17w1bxpv901diw228c5hbkf4hh34qzm2qjkxgl2";
      };

      beamDeps = [ phoenix_html ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.12.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "02ykw1666amp8mjzfwgm155fp4fszg2nv5l4nya09hkvfyd7jznm";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.5.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0i0hxbpkbgv2zi4z04x0l207dgbks2kj4h6kr1h8sq68fkvqfvpa";
      };

      beamDeps = [ cowboy cowboy_telemetry plug ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "1.2.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1nxnxj62iv4yvm4771jbxpj3l4brn2crz053y12s998lv5x1qqw7";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.15.12";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08l9mx9mfp9crb9gzlvylbcqvivil6gjslfidl1aag40m36sjd0j";
      };

      beamDeps = [ connection db_connection decimal jason ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.8.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rfz5ld54pkd2w25jadyznia2vb7aw9bclck21fizargd39wzys9";
      };

      beamDeps = [];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1026l1z1jh25z8bfrhaw0ryk5gprhrpnirq877zqhg253x3x5c5x";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.5.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0hmc4vv9qdqwppwixyf7p3njqhwqgc9pbhzkdd5v4r6py35raww6";
      };

      beamDeps = [ cowboy hackney jason mime plug_cowboy telemetry ];
    };

    tailwind = buildMix rec {
      name = "tailwind";
      version = "0.1.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "02ljpjrsdxi4w5pk8zsks7n220l5y43r89a6yl7qza1i959b73zg";
      };

      beamDeps = [ castore ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0yn5mr83hrx0dslsqxmfr5zf0a65hdak6926zd72i85lb7x0kg3k";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "0.6.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1iilk2n75kn9i95fdp8mpxvn3rcn3ghln7p77cijqws13j3y1sbv";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.0.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0vjgxkxn9ll1gc6xd8jh4b0ldmg9l7fsfg7w63d44gvcssplx8mk";
      };

      beamDeps = [ telemetry ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "08952lw8cjdw8w171lv8wqbrxc4rcmb3jhkrdb7n06gngpbfdvi5";
      };

      beamDeps = [];
    };

    yamerl = buildRebar3 rec {
      name = "yamerl";
      version = "0.8.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0gxjrrdrz9rcfmkg7x7z9p0fcz90dzqyk4laxz8gwi23svwk1jwn";
      };

      beamDeps = [];
    };
  };
in self

