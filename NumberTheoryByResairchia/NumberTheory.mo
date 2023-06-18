package NumberTheory
// --------------------------------------------------------------------
  //                       Number Theory for Modelica
  //         Library for Number Theory for Modelica
// --------------------------------------------------------------------
// Copyright (C) 2023  Jorge L. Lovaco
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this software.  If not, see <http://www.gnu.org/licenses/>.
//
// Primary author: Jorge L. Lovaco <media@resairchia.com>
// Developed by: Resairchia
// Version: 0.0.001
// This is a beta version and still under development. Use at your own risk.
extends NumberTheory.Icons.Packages;
  function BernoulliN
  input Integer n;
  output Real B;
  protected
  Real B_aux;
  algorithm
  //Defnition of the Bernoulli numbers+ (B_1=0.5)
  //See for example the following references:
  //https://en.wikipedia.org/wiki/Bernoulli_number
  //Weisstein, Eric W. "Bernoulli Number." From MathWorld--A Wolfram Web Resource. https://mathworld.wolfram.com/BernoulliNumber.html
    B:=sum((1/(k+1))*sum(((-1)^v)*((v+1)^n)*Binomial(k,v) for v in 0:k) for k in 0:n);
  end BernoulliN;

  function Factorial
    input Integer nIn;
    output Integer nOut;
  algorithm
    if nIn == 0 or nIn == 1 then
      nOut := 1;
    else
      nOut := nIn * Factorial(nIn - 1);
    end if;
  end Factorial;

  model TestBernoulli
  Real Bn[13];
  parameter Integer ns[:]={0,1,2,3,4,5,6,7,8,9,10,11,12};
  Real Zeta[6];
  parameter Integer n[:]={2,4,6,8,10,12};
  equation
  for i in 1:13 loop
    Bn[i]=BernoulliN(ns[i]);
    end for;
  Zeta[1]=(-1)^(2)*BernoulliN(n[1])*(2*Modelica.Constants.pi)^(n[1])/(2*Factorial(n[1]));
  Zeta[2]=(-1)^(3)*BernoulliN(n[2])*(2*Modelica.Constants.pi)^(n[2])/(2*Factorial(n[2]));
  Zeta[3]=(-1)^(4)*BernoulliN(n[3])*(2*Modelica.Constants.pi)^(n[3])/(2*Factorial(n[3]));
  Zeta[4]=(-1)^(5)*BernoulliN(n[4])*(2*Modelica.Constants.pi)^(n[4])/(2*Factorial(n[4]));
  Zeta[5]=(-1)^(6)*BernoulliN(n[5])*(2*Modelica.Constants.pi)^(n[5])/(2*Factorial(n[5]));
  Zeta[6]=(-1)^(7)*BernoulliN(n[6])*(2*Modelica.Constants.pi)^(n[6])/(2*Factorial(n[6]));
  end TestBernoulli;

  function Binomial
  input Integer nIn;
  input Integer kIn;
  output Real n_choose_k;
  algorithm
n_choose_k:=Factorial(nIn)/(Factorial(kIn)*Factorial(nIn-kIn));
  end Binomial;

  package Icons
  extends Packages;
    partial package Background
      annotation(
        Icon(graphics = {Rectangle(lineColor = {171, 171, 171},fillColor = {236, 236, 236}, fillPattern = FillPattern.VerticalCylinder,lineThickness = 1, extent = {{-100, 100}, {100, -100}})}));
    end Background;
  
    partial package Packages
    extends Background;
      annotation(
        Icon(graphics = {Polygon(origin = {65, -57}, lineColor = {85, 0, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.75, points = {{-17, -27}, {-17, 27}, {17, 27}, {17, 15}, {5, 15}, {5, 21}, {-7, 21}, {-7, -27}, {-17, -27}}), Polygon(origin = {83, -69}, lineColor = {85, 0, 255}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{7, 21}, {1, 11}, {-1, -3}, {1, -15}, {-7, -27}, {-11, -27}, {-1, -17}, {-3, 1}, {1, 17}, {11, 25}, {13, 23}, {7, 21}}, smooth = Smooth.Bezier), Polygon(origin = {75, -69}, lineColor = {85, 0, 255}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{1, 5}, {-3, 3}, {-3, -7}, {7, -11}, {5, -7}, {-1, -5}, {-1, 3}, {7, 5}, {7, 7}, {1, 5}}, smooth = Smooth.Bezier), Polygon(origin = {87, -73}, rotation = 180, lineColor = {85, 0, 255}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{1, 5}, {-3, 3}, {-3, -7}, {7, -11}, {5, -7}, {-1, -5}, {-1, 3}, {7, 5}, {7, 7}, {1, 5}}, smooth = Smooth.Bezier)}));
    end Packages;
  
    partial package ExamplesPackageIcon
    extends Packages;
      annotation(
        Icon(graphics = {Polygon(origin = {-10, 0}, lineColor = {85, 0, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-70, 60}, {70, 0}, {-70, -60}, {-70, 60}})}));
    end ExamplesPackageIcon;
  
    partial model ExampleModelIcon
      annotation(
        Icon(graphics = {Ellipse(lineColor = {255, 170, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-80, 80}, {80, -80}}), Polygon(origin = {12, 0}, lineColor = {85, 0, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-70, 60}, {70, 0}, {-70, -60}, {-70, 60}})}));
    end ExampleModelIcon;
  
    partial package InternalUse
      extends Background;
    annotation(
        Icon(graphics = {Ellipse(fillPattern = FillPattern.Solid,lineThickness = 2, extent = {{-80, 80}, {80, -80}}), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid,lineThickness = 2, extent = {{-60, 60}, {60, -60}}), Polygon(origin = {-2, -2}, fillPattern = FillPattern.Solid, points = {{-60, 40}, {-40, 60}, {60, -40}, {40, -60}, {-60, 40}, {-60, 40}})}));
    end InternalUse;
    annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(extent = {{-80, -80}, {80, 80}}, textString = "Ω")}));
  
  end Icons;
annotation(
    Icon(graphics = {Text(origin = {0, 10}, extent = {{-66, 84}, {66, -84}}, textString = "NT")}),
    uses(Modelica(version = "4.0.0")));
end NumberTheory;
