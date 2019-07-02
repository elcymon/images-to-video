cd ../simulation\ log\ results/results/2019-03-14-Uniform_rad14_noBound-Target-Loc/Results/
dirs=(*/)
vidname=Uniform_rad14_noBound
pwd
for dir in "${dirs[@]}"; do
	cd $dir
	echo $dir
	mkdir -p legend nolegend
	mv *-no-legend.png nolegend/
	mv *.png legend/
	cd legend
	cat *.png | ffmpeg -r 20 -i - -s 1080x720 -c:v libx264 -vf fps=50 \
	../$vidname-"${dir///}"-legend-1200secs.mp4
	
	cd ../nolegend
	cat *.png | ffmpeg -r 20 -i - -s 1080x720 -c:v libx264 -vf fps=50 \
	../$vidname-"${dir///}"-nolegend-1200secs.mp4
	cd ../../
done

	
	