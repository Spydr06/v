import os
import v.gen.native
import v.ast
import v.pref

// used in macho_test.v
fn macho_test_new_gen(p &pref.Preferences, out_name string) &native.Gen {
	mut g := native.Gen{
		pref: p
		out_name: out_name
		table: ast.new_table()
		code_gen: native.Amd64{
			g: 0
		}
		labels: 0
	}
	g.code_gen.g = &mut g
	return &g
}

fn test_macho() {
	os.chdir(os.temp_dir()) or {}
	mut g := macho_test_new_gen(&pref.Preferences{
		arch: .amd64
	}, 'test.bin')
	g.generate_macho_header()
	g.generate_macho_footer()
}
