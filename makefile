all:
	@echo "make <pisnicka(.ly)>|clean"

out:
	mkdir out

%: %.ly out
	cp -l $< out/
	cd out && lilypond $< 
	# cd out && timidity $@.midi # -Ow

clean:
	rm -fr out *~

