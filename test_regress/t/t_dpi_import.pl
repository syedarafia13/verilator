#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(simulator => 1);

compile(
    # Amazingly VCS, NC and Verilator all just accept the C file here!
    v_flags2 => ["t/t_dpi_import_c.cpp"],
    verilator_flags2 => ["-Wall -Wno-DECLFILENAME"],
    );

execute(
    check_finished => 1,
    );

ok(1);
1;
