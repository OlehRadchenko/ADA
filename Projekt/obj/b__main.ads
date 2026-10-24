pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 16.1.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#0665dedd#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#b2cfab41#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#9b854977#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#0513e9ec#;
   pragma Export (C, u00005, "ada__calendar__delaysB");
   u00006 : constant Version_32 := 16#205f84f4#;
   pragma Export (C, u00006, "ada__calendar__delaysS");
   u00007 : constant Version_32 := 16#9fbfddeb#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#c907a168#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#6f094a22#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#0c4d3096#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#85bf25f7#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#c1262c0b#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#898beeee#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#7fa0a598#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#af37d7ac#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#33935a56#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#b379e8af#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#3007a9ef#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#282545b2#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#45553a06#;
   pragma Export (C, u00020, "system__storage_elementsS");
   u00021 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00021, "system__soft_links__initializeB");
   u00022 : constant Version_32 := 16#ac2e8b53#;
   pragma Export (C, u00022, "system__soft_links__initializeS");
   u00023 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00023, "system__stack_checkingB");
   u00024 : constant Version_32 := 16#4ed4fbf8#;
   pragma Export (C, u00024, "system__stack_checkingS");
   u00025 : constant Version_32 := 16#45e1965e#;
   pragma Export (C, u00025, "system__exception_tableB");
   u00026 : constant Version_32 := 16#04a098f7#;
   pragma Export (C, u00026, "system__exception_tableS");
   u00027 : constant Version_32 := 16#bb2e51dc#;
   pragma Export (C, u00027, "system__exceptionsS");
   u00028 : constant Version_32 := 16#c367aa24#;
   pragma Export (C, u00028, "system__exceptions__machineB");
   u00029 : constant Version_32 := 16#8d1d496c#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#2f7ce883#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#b985b6bd#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#1eabfddc#;
   pragma Export (C, u00032, "system__img_intS");
   u00033 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00033, "system__tracebackB");
   u00034 : constant Version_32 := 16#0f111a53#;
   pragma Export (C, u00034, "system__tracebackS");
   u00035 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00035, "system__traceback_entriesB");
   u00036 : constant Version_32 := 16#41975162#;
   pragma Export (C, u00036, "system__traceback_entriesS");
   u00037 : constant Version_32 := 16#ef93d144#;
   pragma Export (C, u00037, "system__traceback__symbolicB");
   u00038 : constant Version_32 := 16#3e2e1203#;
   pragma Export (C, u00038, "system__traceback__symbolicS");
   u00039 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00039, "ada__containersS");
   u00040 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00040, "ada__exceptions__tracebackB");
   u00041 : constant Version_32 := 16#47e3d2a3#;
   pragma Export (C, u00041, "ada__exceptions__tracebackS");
   u00042 : constant Version_32 := 16#9111f9c1#;
   pragma Export (C, u00042, "interfacesS");
   u00043 : constant Version_32 := 16#b9ada65a#;
   pragma Export (C, u00043, "interfaces__cB");
   u00044 : constant Version_32 := 16#62e98794#;
   pragma Export (C, u00044, "interfaces__cS");
   u00045 : constant Version_32 := 16#0978786d#;
   pragma Export (C, u00045, "system__bounded_stringsB");
   u00046 : constant Version_32 := 16#fe76cff7#;
   pragma Export (C, u00046, "system__bounded_stringsS");
   u00047 : constant Version_32 := 16#d77133d3#;
   pragma Export (C, u00047, "system__crtlB");
   u00048 : constant Version_32 := 16#aa1e2084#;
   pragma Export (C, u00048, "system__crtlS");
   u00049 : constant Version_32 := 16#71c7401b#;
   pragma Export (C, u00049, "system__dwarf_linesB");
   u00050 : constant Version_32 := 16#69a115c3#;
   pragma Export (C, u00050, "system__dwarf_linesS");
   u00051 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00051, "ada__charactersS");
   u00052 : constant Version_32 := 16#75913d83#;
   pragma Export (C, u00052, "ada__characters__handlingB");
   u00053 : constant Version_32 := 16#729cc5db#;
   pragma Export (C, u00053, "ada__characters__handlingS");
   u00054 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00054, "ada__characters__latin_1S");
   u00055 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00055, "ada__stringsS");
   u00056 : constant Version_32 := 16#9a8aed35#;
   pragma Export (C, u00056, "ada__strings__mapsB");
   u00057 : constant Version_32 := 16#879d83f1#;
   pragma Export (C, u00057, "ada__strings__mapsS");
   u00058 : constant Version_32 := 16#d55f7fbe#;
   pragma Export (C, u00058, "system__bit_opsB");
   u00059 : constant Version_32 := 16#447842d2#;
   pragma Export (C, u00059, "system__bit_opsS");
   u00060 : constant Version_32 := 16#73a191b7#;
   pragma Export (C, u00060, "system__unsigned_typesS");
   u00061 : constant Version_32 := 16#5c2ece6d#;
   pragma Export (C, u00061, "ada__strings__maps__constantsS");
   u00062 : constant Version_32 := 16#f9910acc#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#286773d4#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#bc35044b#;
   pragma Export (C, u00064, "system__img_address_32S");
   u00065 : constant Version_32 := 16#9115a5c9#;
   pragma Export (C, u00065, "system__img_address_64S");
   u00066 : constant Version_32 := 16#d2d62200#;
   pragma Export (C, u00066, "system__img_unsS");
   u00067 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00067, "system__ioB");
   u00068 : constant Version_32 := 16#17c919a1#;
   pragma Export (C, u00068, "system__ioS");
   u00069 : constant Version_32 := 16#264c804d#;
   pragma Export (C, u00069, "system__mmapB");
   u00070 : constant Version_32 := 16#3627bde4#;
   pragma Export (C, u00070, "system__mmapS");
   u00071 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00071, "ada__io_exceptionsS");
   u00072 : constant Version_32 := 16#eabc4cdd#;
   pragma Export (C, u00072, "system__mmap__os_interfaceB");
   u00073 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00073, "system__mmap__os_interfaceS");
   u00074 : constant Version_32 := 16#861c956a#;
   pragma Export (C, u00074, "system__os_libB");
   u00075 : constant Version_32 := 16#b75e9030#;
   pragma Export (C, u00075, "system__os_libS");
   u00076 : constant Version_32 := 16#94d23d25#;
   pragma Export (C, u00076, "system__atomic_operations__test_and_setB");
   u00077 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00077, "system__atomic_operations__test_and_setS");
   u00078 : constant Version_32 := 16#4ee894cb#;
   pragma Export (C, u00078, "system__atomic_operationsS");
   u00079 : constant Version_32 := 16#553a519e#;
   pragma Export (C, u00079, "system__atomic_primitivesB");
   u00080 : constant Version_32 := 16#b3cac880#;
   pragma Export (C, u00080, "system__atomic_primitivesS");
   u00081 : constant Version_32 := 16#14fb286b#;
   pragma Export (C, u00081, "system__case_utilB");
   u00082 : constant Version_32 := 16#57730f84#;
   pragma Export (C, u00082, "system__case_utilS");
   u00083 : constant Version_32 := 16#8b956324#;
   pragma Export (C, u00083, "system__case_util_nssB");
   u00084 : constant Version_32 := 16#ece46ac4#;
   pragma Export (C, u00084, "system__case_util_nssS");
   u00085 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00085, "system__stringsB");
   u00086 : constant Version_32 := 16#1209eef6#;
   pragma Export (C, u00086, "system__stringsS");
   u00087 : constant Version_32 := 16#8d759e14#;
   pragma Export (C, u00087, "system__object_readerB");
   u00088 : constant Version_32 := 16#851f7bf7#;
   pragma Export (C, u00088, "system__object_readerS");
   u00089 : constant Version_32 := 16#da778bc3#;
   pragma Export (C, u00089, "system__val_lliS");
   u00090 : constant Version_32 := 16#16705b28#;
   pragma Export (C, u00090, "system__val_lluS");
   u00091 : constant Version_32 := 16#0d1904b9#;
   pragma Export (C, u00091, "system__val_utilB");
   u00092 : constant Version_32 := 16#65200ccd#;
   pragma Export (C, u00092, "system__val_utilS");
   u00093 : constant Version_32 := 16#382ef1e7#;
   pragma Export (C, u00093, "system__exception_tracesB");
   u00094 : constant Version_32 := 16#65138788#;
   pragma Export (C, u00094, "system__exception_tracesS");
   u00095 : constant Version_32 := 16#a52f52d5#;
   pragma Export (C, u00095, "system__win32S");
   u00096 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00096, "system__wch_conB");
   u00097 : constant Version_32 := 16#5088cd8d#;
   pragma Export (C, u00097, "system__wch_conS");
   u00098 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00098, "system__wch_stwB");
   u00099 : constant Version_32 := 16#7d99e18c#;
   pragma Export (C, u00099, "system__wch_stwS");
   u00100 : constant Version_32 := 16#7cd63de5#;
   pragma Export (C, u00100, "system__wch_cnvB");
   u00101 : constant Version_32 := 16#564807fd#;
   pragma Export (C, u00101, "system__wch_cnvS");
   u00102 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00102, "system__wch_jisB");
   u00103 : constant Version_32 := 16#e3ff65d7#;
   pragma Export (C, u00103, "system__wch_jisS");
   u00104 : constant Version_32 := 16#f169b552#;
   pragma Export (C, u00104, "system__os_primitivesB");
   u00105 : constant Version_32 := 16#8e768b18#;
   pragma Export (C, u00105, "system__os_primitivesS");
   u00106 : constant Version_32 := 16#27732c71#;
   pragma Export (C, u00106, "system__arith_64B");
   u00107 : constant Version_32 := 16#787904d8#;
   pragma Export (C, u00107, "system__arith_64S");
   u00108 : constant Version_32 := 16#ff7f7d40#;
   pragma Export (C, u00108, "system__task_lockB");
   u00109 : constant Version_32 := 16#e801d980#;
   pragma Export (C, u00109, "system__task_lockS");
   u00110 : constant Version_32 := 16#8f947e37#;
   pragma Export (C, u00110, "system__win32__extS");
   u00111 : constant Version_32 := 16#a201b8c5#;
   pragma Export (C, u00111, "ada__strings__text_buffersB");
   u00112 : constant Version_32 := 16#a7cfd09b#;
   pragma Export (C, u00112, "ada__strings__text_buffersS");
   u00113 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00113, "ada__strings__utf_encodingB");
   u00114 : constant Version_32 := 16#c9e86997#;
   pragma Export (C, u00114, "ada__strings__utf_encodingS");
   u00115 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00115, "ada__strings__utf_encoding__stringsB");
   u00116 : constant Version_32 := 16#b85ff4b6#;
   pragma Export (C, u00116, "ada__strings__utf_encoding__stringsS");
   u00117 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00117, "ada__strings__utf_encoding__wide_stringsB");
   u00118 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00118, "ada__strings__utf_encoding__wide_stringsS");
   u00119 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00119, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00120 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00120, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00121 : constant Version_32 := 16#df45aed8#;
   pragma Export (C, u00121, "ada__tagsB");
   u00122 : constant Version_32 := 16#99822aba#;
   pragma Export (C, u00122, "ada__tagsS");
   u00123 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00123, "system__htableB");
   u00124 : constant Version_32 := 16#0852b605#;
   pragma Export (C, u00124, "system__htableS");
   u00125 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00125, "system__string_hashB");
   u00126 : constant Version_32 := 16#af17367a#;
   pragma Export (C, u00126, "system__string_hashS");
   u00127 : constant Version_32 := 16#c7620b41#;
   pragma Export (C, u00127, "ada__text_ioB");
   u00128 : constant Version_32 := 16#454e52bb#;
   pragma Export (C, u00128, "ada__text_ioS");
   u00129 : constant Version_32 := 16#6e6e3f5b#;
   pragma Export (C, u00129, "ada__streamsB");
   u00130 : constant Version_32 := 16#bd793559#;
   pragma Export (C, u00130, "ada__streamsS");
   u00131 : constant Version_32 := 16#44f765f3#;
   pragma Export (C, u00131, "system__put_imagesB");
   u00132 : constant Version_32 := 16#9994622c#;
   pragma Export (C, u00132, "system__put_imagesS");
   u00133 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00133, "ada__strings__text_buffers__utilsB");
   u00134 : constant Version_32 := 16#89062ac3#;
   pragma Export (C, u00134, "ada__strings__text_buffers__utilsS");
   u00135 : constant Version_32 := 16#1cacf006#;
   pragma Export (C, u00135, "interfaces__c_streamsB");
   u00136 : constant Version_32 := 16#ecfa876a#;
   pragma Export (C, u00136, "interfaces__c_streamsS");
   u00137 : constant Version_32 := 16#a94e7662#;
   pragma Export (C, u00137, "system__file_ioB");
   u00138 : constant Version_32 := 16#efc4bba8#;
   pragma Export (C, u00138, "system__file_ioS");
   u00139 : constant Version_32 := 16#7598b591#;
   pragma Export (C, u00139, "ada__finalizationS");
   u00140 : constant Version_32 := 16#d00f339c#;
   pragma Export (C, u00140, "system__finalization_rootB");
   u00141 : constant Version_32 := 16#83f7d03a#;
   pragma Export (C, u00141, "system__finalization_rootS");
   u00142 : constant Version_32 := 16#8e328749#;
   pragma Export (C, u00142, "system__finalization_primitivesB");
   u00143 : constant Version_32 := 16#94cebe17#;
   pragma Export (C, u00143, "system__finalization_primitivesS");
   u00144 : constant Version_32 := 16#2dc4039e#;
   pragma Export (C, u00144, "system__os_locksS");
   u00145 : constant Version_32 := 16#e3305969#;
   pragma Export (C, u00145, "system__file_control_blockS");
   u00146 : constant Version_32 := 16#61303e08#;
   pragma Export (C, u00146, "dok_pkgB");
   u00147 : constant Version_32 := 16#12483c68#;
   pragma Export (C, u00147, "dok_pkgS");
   u00148 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00148, "ada__numericsS");
   u00149 : constant Version_32 := 16#752a67ed#;
   pragma Export (C, u00149, "system__concat_3B");
   u00150 : constant Version_32 := 16#03f1f74c#;
   pragma Export (C, u00150, "system__concat_3S");
   u00151 : constant Version_32 := 16#02cecc7b#;
   pragma Export (C, u00151, "system__concat_6B");
   u00152 : constant Version_32 := 16#0bd91fe6#;
   pragma Export (C, u00152, "system__concat_6S");
   u00153 : constant Version_32 := 16#048330cd#;
   pragma Export (C, u00153, "system__random_numbersB");
   u00154 : constant Version_32 := 16#7cb62e47#;
   pragma Export (C, u00154, "system__random_numbersS");
   u00155 : constant Version_32 := 16#ed5b83eb#;
   pragma Export (C, u00155, "system__random_seedB");
   u00156 : constant Version_32 := 16#193f6c1c#;
   pragma Export (C, u00156, "system__random_seedS");
   u00157 : constant Version_32 := 16#bc072aa2#;
   pragma Export (C, u00157, "system__val_unsS");
   u00158 : constant Version_32 := 16#579d64c6#;
   pragma Export (C, u00158, "system__taskingB");
   u00159 : constant Version_32 := 16#1dfbb52d#;
   pragma Export (C, u00159, "system__taskingS");
   u00160 : constant Version_32 := 16#6c9ca1aa#;
   pragma Export (C, u00160, "system__task_primitivesS");
   u00161 : constant Version_32 := 16#5f148137#;
   pragma Export (C, u00161, "system__os_interfaceS");
   u00162 : constant Version_32 := 16#08af0550#;
   pragma Export (C, u00162, "interfaces__c__stringsB");
   u00163 : constant Version_32 := 16#9231d660#;
   pragma Export (C, u00163, "interfaces__c__stringsS");
   u00164 : constant Version_32 := 16#1e971071#;
   pragma Export (C, u00164, "system__task_primitives__operationsB");
   u00165 : constant Version_32 := 16#b2c96b80#;
   pragma Export (C, u00165, "system__task_primitives__operationsS");
   u00166 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00166, "system__float_controlB");
   u00167 : constant Version_32 := 16#6977add2#;
   pragma Export (C, u00167, "system__float_controlS");
   u00168 : constant Version_32 := 16#2cd40a52#;
   pragma Export (C, u00168, "system__interrupt_managementB");
   u00169 : constant Version_32 := 16#cdef2bfc#;
   pragma Export (C, u00169, "system__interrupt_managementS");
   u00170 : constant Version_32 := 16#414d8432#;
   pragma Export (C, u00170, "system__multiprocessorsB");
   u00171 : constant Version_32 := 16#b127719d#;
   pragma Export (C, u00171, "system__multiprocessorsS");
   u00172 : constant Version_32 := 16#6c8afeef#;
   pragma Export (C, u00172, "system__task_infoB");
   u00173 : constant Version_32 := 16#1eed0240#;
   pragma Export (C, u00173, "system__task_infoS");
   u00174 : constant Version_32 := 16#d78ede03#;
   pragma Export (C, u00174, "system__tasking__debugB");
   u00175 : constant Version_32 := 16#77973bad#;
   pragma Export (C, u00175, "system__tasking__debugS");
   u00176 : constant Version_32 := 16#ca878138#;
   pragma Export (C, u00176, "system__concat_2B");
   u00177 : constant Version_32 := 16#3c709d19#;
   pragma Export (C, u00177, "system__concat_2S");
   u00178 : constant Version_32 := 16#7c6f2528#;
   pragma Export (C, u00178, "system__stack_usageB");
   u00179 : constant Version_32 := 16#785c8e50#;
   pragma Export (C, u00179, "system__stack_usageS");
   u00180 : constant Version_32 := 16#3c653e49#;
   pragma Export (C, u00180, "system__tasking__rendezvousB");
   u00181 : constant Version_32 := 16#a3fb0543#;
   pragma Export (C, u00181, "system__tasking__rendezvousS");
   u00182 : constant Version_32 := 16#49c205ec#;
   pragma Export (C, u00182, "system__restrictionsB");
   u00183 : constant Version_32 := 16#24e8bc7f#;
   pragma Export (C, u00183, "system__restrictionsS");
   u00184 : constant Version_32 := 16#c6c29203#;
   pragma Export (C, u00184, "system__tasking__entry_callsB");
   u00185 : constant Version_32 := 16#392166f7#;
   pragma Export (C, u00185, "system__tasking__entry_callsS");
   u00186 : constant Version_32 := 16#9d855b97#;
   pragma Export (C, u00186, "system__tasking__initializationB");
   u00187 : constant Version_32 := 16#a640675f#;
   pragma Export (C, u00187, "system__tasking__initializationS");
   u00188 : constant Version_32 := 16#202da2c8#;
   pragma Export (C, u00188, "system__soft_links__taskingB");
   u00189 : constant Version_32 := 16#13803e06#;
   pragma Export (C, u00189, "system__soft_links__taskingS");
   u00190 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00190, "ada__exceptions__is_null_occurrenceB");
   u00191 : constant Version_32 := 16#4e579345#;
   pragma Export (C, u00191, "ada__exceptions__is_null_occurrenceS");
   u00192 : constant Version_32 := 16#a9888037#;
   pragma Export (C, u00192, "system__tasking__task_attributesB");
   u00193 : constant Version_32 := 16#1b9d5095#;
   pragma Export (C, u00193, "system__tasking__task_attributesS");
   u00194 : constant Version_32 := 16#26693882#;
   pragma Export (C, u00194, "system__tasking__protected_objectsB");
   u00195 : constant Version_32 := 16#4f637f16#;
   pragma Export (C, u00195, "system__tasking__protected_objectsS");
   u00196 : constant Version_32 := 16#4396362c#;
   pragma Export (C, u00196, "system__tasking__protected_objects__entriesB");
   u00197 : constant Version_32 := 16#cb7c0568#;
   pragma Export (C, u00197, "system__tasking__protected_objects__entriesS");
   u00198 : constant Version_32 := 16#9154a8e6#;
   pragma Export (C, u00198, "system__tasking__protected_objects__operationsB");
   u00199 : constant Version_32 := 16#15b668af#;
   pragma Export (C, u00199, "system__tasking__protected_objects__operationsS");
   u00200 : constant Version_32 := 16#9579476d#;
   pragma Export (C, u00200, "system__tasking__queuingB");
   u00201 : constant Version_32 := 16#18afeff7#;
   pragma Export (C, u00201, "system__tasking__queuingS");
   u00202 : constant Version_32 := 16#ada70375#;
   pragma Export (C, u00202, "system__tasking__utilitiesB");
   u00203 : constant Version_32 := 16#0e2c7d81#;
   pragma Export (C, u00203, "system__tasking__utilitiesS");
   u00204 : constant Version_32 := 16#4e50a72b#;
   pragma Export (C, u00204, "system__tasking__stagesB");
   u00205 : constant Version_32 := 16#3fb7991c#;
   pragma Export (C, u00205, "system__tasking__stagesS");
   u00206 : constant Version_32 := 16#2d236812#;
   pragma Export (C, u00206, "ada__task_initializationB");
   u00207 : constant Version_32 := 16#d7b0c315#;
   pragma Export (C, u00207, "ada__task_initializationS");
   u00208 : constant Version_32 := 16#363dd500#;
   pragma Export (C, u00208, "ada__real_timeB");
   u00209 : constant Version_32 := 16#cd39c108#;
   pragma Export (C, u00209, "ada__real_timeS");
   u00210 : constant Version_32 := 16#c008e5f7#;
   pragma Export (C, u00210, "mars_typyB");
   u00211 : constant Version_32 := 16#f97af706#;
   pragma Export (C, u00211, "mars_typyS");
   u00212 : constant Version_32 := 16#1bbbb1b1#;
   pragma Export (C, u00212, "laziki_pkgB");
   u00213 : constant Version_32 := 16#2becda7f#;
   pragma Export (C, u00213, "laziki_pkgS");
   u00214 : constant Version_32 := 16#16431bd2#;
   pragma Export (C, u00214, "monitor_pkgB");
   u00215 : constant Version_32 := 16#f064496c#;
   pragma Export (C, u00215, "monitor_pkgS");
   u00216 : constant Version_32 := 16#0a8d5931#;
   pragma Export (C, u00216, "silosy_pkgB");
   u00217 : constant Version_32 := 16#d888dd12#;
   pragma Export (C, u00217, "silosy_pkgS");
   u00218 : constant Version_32 := 16#63bad2e6#;
   pragma Export (C, u00218, "system__concat_9B");
   u00219 : constant Version_32 := 16#dd642685#;
   pragma Export (C, u00219, "system__concat_9S");
   u00220 : constant Version_32 := 16#bcc987d2#;
   pragma Export (C, u00220, "system__concat_4B");
   u00221 : constant Version_32 := 16#ba73b1d0#;
   pragma Export (C, u00221, "system__concat_4S");
   u00222 : constant Version_32 := 16#ebb39bbb#;
   pragma Export (C, u00222, "system__concat_5B");
   u00223 : constant Version_32 := 16#c9123f35#;
   pragma Export (C, u00223, "system__concat_5S");
   u00224 : constant Version_32 := 16#ada38524#;
   pragma Export (C, u00224, "system__concat_7B");
   u00225 : constant Version_32 := 16#8076af71#;
   pragma Export (C, u00225, "system__concat_7S");
   u00226 : constant Version_32 := 16#a56a70fa#;
   pragma Export (C, u00226, "system__memoryB");
   u00227 : constant Version_32 := 16#911f72f4#;
   pragma Export (C, u00227, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  ada.task_initialization%s
   --  ada.task_initialization%b
   --  interfaces%s
   --  system%s
   --  system.atomic_operations%s
   --  system.case_util_nss%s
   --  system.case_util_nss%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  system.crtl%b
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.img_address_32%s
   --  system.img_address_64%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.concat_7%s
   --  system.concat_7%b
   --  system.concat_9%s
   --  system.concat_9%b
   --  system.img_int%s
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.img_uns%s
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.numerics%s
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.arith_64%s
   --  system.arith_64%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_locks%s
   --  system.finalization_primitives%s
   --  system.finalization_primitives%b
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  system.task_primitives%s
   --  system.val_uns%s
   --  system.win32.ext%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  mars_typy%s
   --  mars_typy%b
   --  dok_pkg%s
   --  dok_pkg%b
   --  silosy_pkg%s
   --  silosy_pkg%b
   --  monitor_pkg%s
   --  monitor_pkg%b
   --  laziki_pkg%s
   --  laziki_pkg%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
