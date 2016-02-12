#define HvFunctins_cxx
#include <math.h>
#include <TH1.h>
#include <iostream>
#include <algorithm>
#include <TMath.h>
#include <TVector2.h>

float CalculateCalRatio(float emfrac, float energy) {
	//Cal Ratio is Hadrionic Energy / Electromagnetic Energy
	float calratio = 0;
	float emEnergy = emfrac*energy;
	float hadEnergy = (1-emfrac)*energy;
	//cout << "emfrac:" << emfrac << endl;
	if (emfrac <= 0) {
		calratio = 20;
	} else if (emfrac >= 1) {
		calratio = 0;
	} else {
		calratio = log10((1 - emfrac) / emfrac);
	}
	//cout << "calratio:" << calratio << endl;
	return calratio;
}

float CountTracks(float jetPhi, float jetEta, float trkPhi, float trkEta, float trkPt) {
	//Gets number of tracks

	//Define Variables
	int TrkCount = 0;

	float trkDeltaPhi = TVector2::Phi_mpi_pi(jetPhi - trkPhi);
	float trkDeltaEta = jetEta - trkEta;
	float trkDeltaRsquared = TMath::Power(trkDeltaEta, 2) + TMath::Power(trkDeltaPhi, 2);
	if ( trkDeltaRsquared <= 0.04 ) {
		trkPt = trkPt / 1000;
	}
	if (trkPt >= 1) {
		TrkCount++;
	}
	return TrkCount;
}
