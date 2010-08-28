all:
	@echo "make <pisnicka(.ly)>|clean"

out:
	mkdir out

%: %.ly out
	cp -l $< out/
	cd out && lilypond --ps $< && ps2pdf $@.ps
	cd out && timidity $@.mid* -Ow

clean:
	rm -fr out *~

