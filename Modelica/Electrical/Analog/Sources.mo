within Modelica.Electrical.Analog;
package Sources "Time-dependend and controlled voltage and current sources"

  extends Modelica.Icons.Library;

  annotation(preferedView="info",
    Window(
      x=0.03,
      y=0.04,
      width=0.50,
      height=0.60,
      library=1,
      autolayout=1),Documentation(info="<html>
<p>
This package contains time-dependend and controlled voltage and current sources.
</p>

</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>"));

  model SignalVoltage
    "Generic voltage source using the input signal as source voltage"

    Interfaces.PositivePin p annotation (extent=[-110, -10; -90, 10]);
    Interfaces.NegativePin n annotation (extent=[110, -10; 90, 10]);
    Modelica.Blocks.Interfaces.RealInput v(
        redeclare type SignalType = SI.Voltage)
      "Voltage between pin p and n (= p.v - n.v) as input signal"
       annotation (extent=[-20, 50; 20, 90], rotation=-90);
    SI.Current i "Current flowing from pin p to pin n";

    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-90, 0; -50, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50, 0; 90, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[-50, 0; 50, 0], style(color=0, rgbcolor={0,0,0})),
        Text(extent=[-100, -120; 100, -80], string="%name"),
        Text(
          extent=[-120,50; -20,0],
          style(color=3, rgbcolor={0,0,255}),
          string="+"),
        Text(
          extent=[20,50; 120,0],
          style(color=3, rgbcolor={0,0,255}),
          string="-")),
      Window(
        x=0.36,
        y=0.03,
        width=0.62,
        height=0.76),
      Diagram(
        Ellipse(extent=[-50,50; 50,-50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-96,0; -50,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50,0; 96,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[-50,0; 50,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[-109,20; -84,20],   style(color=9, fillColor=9)),
        Polygon(points=[-94,23; -84,20; -94,17; -94,23],     style(
            color=9,
            fillColor=9,
            fillPattern=1)),
        Line(points=[91,20; 116,20],   style(color=9, fillColor=9)),
        Text(
          extent=[-109,25; -89,45],
          string="i",
          style(color=9)),
        Polygon(points=[106,23; 116,20; 106,17; 106,23],     style(
            color=9,
            fillColor=9,
            fillPattern=1)),
        Text(
          extent=[91,45; 111,25],
          string="i",
          style(color=9)),
        Line(points=[-119,-5; -119,5],   style(color=9)),
        Line(points=[-124,0; -114,0],   style(color=9)),
        Line(points=[116,0; 126,0],   style(color=9))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
  equation
    v = p.v - n.v;
    0 = p.i + n.i;
    i = p.i;
  end SignalVoltage;

  model ConstantVoltage "Source for constant voltage"
    parameter SI.Voltage V=1 "Value of constant voltage";
    extends Interfaces.OnePort;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.33,
        y=0.18,
        width=0.6,
        height=0.6),
      Icon(
        Line(points=[-90, 0; -10, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[-10, 60; -10, -60], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, 30; 0, -30], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, 0; 90, 0], style(color=0, rgbcolor={0,0,0})),
        Text(extent=[-100, -120; 100, -80], string="%name=%V"),
        Text(
          extent=[-120,50; -20,0],
          style(color=3, rgbcolor={0,0,255}),
          string="+"),
        Text(
          extent=[20,50; 120,0],
          style(color=3, rgbcolor={0,0,255}),
          string="-")),
      Diagram(
        Line(points=[-90, 0; -10, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[-10, 60; -10, -60], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, 30; 0, -30], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, 0; 90, 0], style(color=0, rgbcolor={0,0,0}))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  equation
    v = V;
  end ConstantVoltage;

  model StepVoltage "Step voltage source"
    parameter SI.Voltage V=1 "Height of step";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Step
        signalSource(height=V));
    annotation (
      Icon(Line(points=[-70, -70; 0, -70; 0, 70; 69, 70], style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-80, -18; 0, -18; 0, 50; 80, 50], style(color=0, thickness=
               2)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
              fillColor=8)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Text(
          extent=[-21, -72; 25, -90],
          string="startTime",
          style(color=9)),
        Line(points=[0, -17; 0, -71], style(color=8, pattern=2)),
        Text(
          extent=[-68, -36; -22, -54],
          string="offset",
          style(color=9)),
        Line(points=[-13, 50; -13, -17], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[2, 50; -19, 50; 2, 50], style(color=8, pattern=2)),
        Polygon(points=[-13, -17; -16, -4; -10, -4; -13, -17; -13, -17], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-13, 50; -16, 37; -9, 37; -13, 50], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-68, 26; -22, 8],
          string="V",
          style(color=9)),
        Polygon(points=[-13, -69; -16, -56; -10, -56; -13, -69; -13, -69],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-13, -18; -13, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-13, -18; -16, -31; -9, -31; -13, -18], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-67, 93; -2, 67],
          string="v = p.v - n.v",
          style(color=9))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.28,
        y=0,
        width=0.72,
        height=0.73),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end StepVoltage;

  model RampVoltage "Ramp voltage source"
    parameter SI.Voltage V=1 "Height of ramp";
    parameter SI.Time duration(min=Modelica.Constants.small) = 2
      "Duration of ramp";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Ramp
        signalSource( final height=
                 V, final duration=duration));
    annotation (
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-80, -20; -20, -20; 50, 50], style(color=0, thickness=2)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-40, -20; -42, -30; -37, -30; -40, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -20; -40, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-80, -33; -41, -49],
          string="offset",
          style(color=9)),
        Text(
          extent=[-40, -70; 6, -88],
          string="startTime",
          style(color=9)),
        Text(
          extent=[-67, 93; -2, 67],
          string="v = p.v - n.v",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-20, -20; -20, -70], style(color=8, pattern=2)),
        Line(points=[-19, -20; 50, -20], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Line(points=[50, 50; 101, 50], style(color=0, thickness=2)),
        Line(points=[50, 50; 50, -20], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[50, -20; 42, -18; 42, -22; 50, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-20, -20; -11, -18; -11, -22; -20, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[50, 50; 48, 40; 53, 40; 50, 50], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[50, -20; 47, -10; 52, -10; 50, -20; 50, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[53, 25; 82, 7],
          string="V",
          style(color=9)),
        Text(
          extent=[0, -17; 35, -37],
          string="duration",
          style(color=9))),
      Icon(Line(points=[-80, -60; -50, -60; 50, 60; 80, 60], style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.29,
        y=0.11,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end RampVoltage;

  model SineVoltage "Sine voltage source"
    parameter SI.Voltage V=1 "Amplitude of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Frequency freqHz=1 "Frequency of sine wave";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Sine
        signalSource(
        amplitude=V,
        freqHz=freqHz,
        phase=phase));
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.37,
        y=0.06,
        width=0.6,
        height=0.6),
      Icon(Line(points=[-66,0; -56.2,29.9; -49.8,46.5; -44.2,58.1; -39.3,65.2;
              -34.3,69.2; -29.4,69.8; -24.5,67; -19.6,61; -14.6,52; -9,38.6;
              -1.98,18.6; 12.79,-26.9; 19.1,-44; 24.8,-56.2; 29.7,-64; 34.6,
              -68.6; 39.5,-70; 44.5,-67.9; 49.4,-62.5; 54.3,-54.1; 59.9,-41.3;
              67,-21.7; 74,0],                      style(color=8))),
      Diagram(
        Line(points=[-80, -90; -80, 84], style(color=8)),
        Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
              fillColor=8)),
        Line(points=[-99, -40; 85, -40], style(color=8)),
        Polygon(points=[101, -40; 85, -34; 85, -46; 101, -40], style(color=8,
              fillColor=8)),
        Line(points=[-40, 0; -31.6, 34.2; -26.1, 53.1; -21.3, 66.4; -17.1, 74.6;
                -12.9, 79.1; -8.64, 79.8; -4.42, 76.6; -0.201, 69.7; 4.02, 59.4;
                8.84, 44.1; 14.9, 21.2; 27.5, -30.8; 33, -50.2; 37.8, -64.2; 42,
                -73.1; 46.2, -78.4; 50.5, -80; 54.7, -77.6; 58.9, -71.5; 63.1,
              -61.9; 67.9, -47.2; 74, -24.8; 80, 0], style(color=0, thickness=2)),
        Line(points=[-41, -2; -80, -2], style(color=0, thickness=2)),
        Text(
          extent=[-106, -11; -60, -29],
          string="offset",
          style(color=9)),
        Line(points=[-41, -2; -41, -40], style(color=8, pattern=2)),
        Text(
          extent=[-60, -43; -14, -61],
          string="startTime",
          style(color=9)),
        Text(
          extent=[84, -52; 108, -72],
          string="time",
          style(color=9)),
        Line(points=[-9, 79; 43, 79], style(color=8, pattern=2)),
        Line(points=[-42, -1; 50, 0], style(color=8, pattern=2)),
        Polygon(points=[33, 80; 30, 67; 37, 67; 33, 80], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[37, 57; 83, 39],
          string="V",
          style(color=9)),
        Polygon(points=[33, 1; 30, 14; 36, 14; 33, 1; 33, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[33, 79; 33, 0], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-69, 109; -4, 83],
          string="v = p.v - n.v",
          style(color=9))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end SineVoltage;

  model ExpSineVoltage "Exponentially damped sine voltage source"
    parameter SI.Voltage V=1 "Amplitude of sine wave";
    parameter SI.Frequency freqHz=2 "Frequency of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Damping damping=1 "Damping coefficient of sine wave";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.ExpSine
        signalSource(
        amplitude=V,
        freqHz=freqHz,
        phase=phase,
        damping=damping));
    annotation (
      Icon(Line(points=[-64,-14; -59.2,18.3; -56,36.3; -52.7,50.5; -49.5,60.2;
              -46.3,65.3; -43.1,65.6; -39.9,61.3; -36.7,53.1; -32.6,38.2; -27,
              11.8; -19,-27.9; -14.2,-47.7; -10.1,-59.9; -6.1,-67.2; -2.1,-69.3;
              1.9,-66.5; 5.9,-59.3; 10.77,-46.1; 24.44,-0.3; 29.3,12.4; 34.1,
              20.8; 38.1,24; 42.9,23.2; 47.8,17.8; 54.2,5.4; 67.1,-24.5; 73.5,
              -35.2; 79.1,-39.9; 84.7,-39.9; 91.2,-34.5; 96,-27.8],
                                             style(color=8))),
      Diagram(
        Line(points=[-80, -90; -80, 84], style(color=8)),
        Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
              fillColor=8)),
        Line(points=[-99, -40; 85, -40], style(color=8)),
        Polygon(points=[101, -40; 85, -34; 85, -46; 101, -40], style(color=8,
              fillColor=8)),
        Line(points=[-50, 0; -46.1, 28.2; -43.5, 44; -40.9, 56.4; -38.2, 64.9;
              -35.6, 69.4; -33, 69.6; -30.4, 65.9; -27.8, 58.7; -24.5, 45.7; -
              19.9, 22.5; -13.4, -12.2; -9.5, -29.5; -6.23, -40.1; -2.96, -46.5;
                0.302, -48.4; 3.57, -45.9; 6.83, -39.6; 10.8, -28.1; 21.9, 12;
              25.8, 23.1; 29.7, 30.5; 33, 33.3; 36.9, 32.5; 40.8, 27.8; 46,
              16.9; 56.5, -9.2; 61.7, -18.6; 66.3, -22.7; 70.9, -22.6; 76.1, -
              18; 80, -12.1], style(color=0, thickness=2)),
        Text(
          extent=[-78, 1; -55, -19],
          string="offset",
          style(color=9)),
        Text(
          extent=[-72, -36; -26, -54],
          string="startTime",
          style(color=9)),
        Text(
          extent=[84, -52; 108, -72],
          string="time",
          style(color=9)),
        Line(points=[-50, 0; 18, 0], style(color=8, pattern=2)),
        Line(points=[-50, 0; -81, 0], style(color=0, thickness=2)),
        Line(points=[-50, 77; -50, 0], style(color=8, pattern=2)),
        Line(points=[18, -1; 18, 76], style(color=8, pattern=2)),
        Line(points=[18, 73; -50, 73], style(color=8)),
        Text(
          extent=[-42, 88; 9, 74],
          string="1/freqHz",
          style(color=9)),
        Polygon(points=[-49, 73; -40, 75; -40, 71; -49, 73], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[18, 73; 10, 75; 10, 71; 18, 73], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-50, -61; -19, -61], style(color=8)),
        Polygon(points=[-18, -61; -26, -59; -26, -63; -18, -61], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-51, -63; -27, -75],
          string="t",
          style(color=9)),
        Text(
          extent=[-82, -67; 108, -96],
          string="V*exp(-damping*t)*sin(2*pi*freqHz*t+phase)",
          style(color=9)),
        Line(points=[-50, 0; -50, -40], style(color=8, pattern=2)),
        Line(points=[-50, -54; -50, -72], style(color=8, pattern=2)),
        Line(points=[18, -76; -1, -48], style(color=8, pattern=2)),
        Text(
          extent=[-77, 105; -38, 92],
          string="v = p.v - n.v",
          style(color=9))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.33,
        y=0.06,
        width=0.6,
        height=0.75),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end ExpSineVoltage;

  model ExponentialsVoltage " Rising and falling exponential voltage source"
    parameter Real vMax=1 "Upper bound for rising edge";
    parameter SI.Time riseTime(min=0) = 0.5 "Rise time";
    parameter SI.Time riseTimeConst(min=Modelica.Constants.small) = 0.1
      "Rise time constant";
    parameter SI.Time fallTimeConst(min=Modelica.Constants.small) = riseTimeConst
      "Fall time constant";
    extends Interfaces.VoltageSource(redeclare
        Modelica.Blocks.Sources.Exponentials signalSource(
        outMax=vMax,
        riseTime=riseTime,
        riseTimeConst=riseTimeConst,
        fallTimeConst=fallTimeConst));
    annotation (
      Icon(Line(points=[-76, -59; -73.2, -44.3; -70.3, -31.1; -66.8, -16.6; -
              63.3, -4; -59.7, 6.92; -55.5, 18.18; -51.3, 27.7; -46.3, 37; -
              40.6, 45.5; -34.3, 53.1; -27.2, 59.6; -18.7, 65.3; -8.1, 70.2; -6,
                71; -3.88, 58.5; -1.05, 43.7; 1.78, 30.8; 4.606, 19.45; 8.14,
              7.3; 11.68, -3; 15.9, -13.2; 20.2, -21.6; 25.1, -29.5; 30.8, -
              36.4; 37.1, -42.3; 44.9, -47.5; 54.8, -51.8; 64, -54.4], style(
              color=8))),
      Diagram(
        Line(points=[-100, -70; 84, -70], style(color=8)),
        Polygon(points=[100, -70; 84, -64; 84, -76; 100, -70], style(color=8,
              fillColor=8)),
        Line(points=[-40, -30; -37.2, -15.3; -34.3, -2.1; -30.8, 12.4; -27.3,
              25; -23.7, 35.92; -19.5, 47.18; -15.3, 56.7; -10.3, 66; -4.6,
              74.5; 1.7, 82.1; 8.8, 88.6; 17.3, 94.3; 27.9, 99.2; 30, 100;
              32.12, 87.5; 34.95, 72.7; 37.78, 59.8; 40.606, 48.45; 44.14, 36.3;
                47.68, 26; 51.9, 15.8; 56.2, 7.4; 61.1, -0.5; 66.8, -7.4; 73.1,
                -13.3; 80.9, -18.5; 90.8, -22.8; 100, -25.4], style(color=0,
              thickness=2)),
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Text(
          extent=[-70, 91; -29, 71],
          string="outPort",
          style(color=9)),
        Text(
          extent=[-78, -43; -46, -56],
          string="offset",
          style(color=9)),
        Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -29; -40, -60], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-40, -30; -42, -40; -37, -40; -40, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-39, -30; -80, -30], style(color=0, thickness=2)),
        Text(
          extent=[-59, -71; -13, -89],
          string="startTime",
          style(color=9)),
        Polygon(points=[-41, -30; -32, -28; -32, -32; -41, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -30; 29, -30], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[29, -30; 21, -28; 21, -32; 29, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-26, -12; 19, -28],
          string="riseTime",
          style(color=9)),
        Text(
          extent=[78, -76; 102, -96],
          string="time",
          style(color=9)),
        Line(points=[-100, -70; 84, -70], style(color=8)),
        Polygon(points=[100, -70; 84, -64; 84, -76; 100, -70], style(color=8,
              fillColor=8)),
        Line(points=[-40, -30; -37.2, -15.3; -34.3, -2.1; -30.8, 12.4; -27.3,
              25; -23.7, 35.92; -19.5, 47.18; -15.3, 56.7; -10.3, 66; -4.6,
              74.5; 1.7, 82.1; 8.8, 88.6; 17.3, 94.3; 27.9, 99.2; 30, 100;
              32.12, 87.5; 34.95, 72.7; 37.78, 59.8; 40.606, 48.45; 44.14, 36.3;
                47.68, 26; 51.9, 15.8; 56.2, 7.4; 61.1, -0.5; 66.8, -7.4; 73.1,
                -13.3; 80.9, -18.5; 90.8, -22.8; 100, -25.4], style(color=0,
              thickness=2)),
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Text(
          extent=[-70, 91; -29, 71],
          string="outPort",
          style(color=9)),
        Text(
          extent=[-78, -43; -46, -56],
          string="offset",
          style(color=9)),
        Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -29; -40, -60], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-40, -30; -42, -40; -37, -40; -40, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-39, -30; -80, -30], style(color=0, thickness=2)),
        Text(
          extent=[-59, -71; -13, -89],
          string="startTime",
          style(color=9)),
        Polygon(points=[-41, -30; -32, -28; -32, -32; -41, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -30; 29, -30], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[29, -30; 21, -28; 21, -32; 29, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-26, -12; 19, -28],
          string="riseTime",
          style(color=9)),
        Text(
          extent=[78, -76; 102, -96],
          string="time",
          style(color=9)),
        Line(points=[30, 100; 30, -34], style(color=8, pattern=2))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.11,
        y=0.12,
        width=0.78,
        height=0.83),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end ExponentialsVoltage;

  model PulseVoltage "Pulse voltage source"
    parameter SI.Voltage V=1 "Amplitude of pulse";
    parameter Real width(
      final min=Modelica.Constants.small,
      final max=100) = 50 "Width of pulse in % of period";
    parameter SI.Time period(final min=Modelica.Constants.small) = 1
      "Time for one period";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Pulse
        signalSource(
        amplitude=V,
        width=width,
        period=period));
    annotation (
      Icon(Line(points=[-70,-70; -40,-70; -40,70; 0,70; 0,-70; 40,-70; 40,70;
              80,70],        style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, 1; -37, -12; -30, -12; -34, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-34, -1; -34, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-33, -70; -36, -57; -30, -57; -33, -70; -33, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-78, -24; -35, -36],
          string="offset",
          style(color=9)),
        Text(
          extent=[-31, -69; 15, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-10, 0; -10, -70], style(color=8, pattern=2)),
        Line(points=[-80, 0; -20, 0; -21, 50; 21, 50; 20, -1; 41, 0; 40, 50; 80,
                51], style(color=0, thickness=2)),
        Line(points=[-19, 88; -19, 49], style(color=8, pattern=2)),
        Line(points=[21, 74; 21, 50], style(color=9, pattern=2)),
        Line(points=[41, 88; 41, 50], style(color=8, pattern=2)),
        Line(points=[-19, 83; 42, 83], style(color=8)),
        Line(points=[-19, 69; 21, 69], style(color=8)),
        Text(
          extent=[-9, 97; 37, 85],
          string="period",
          style(color=9)),
        Text(
          extent=[-18, 81; 21, 69],
          string="width",
          style(color=9)),
        Line(points=[-52, 50; -19, 50], style(color=8, pattern=2)),
        Line(points=[-34, 50; -34, 1], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-78, 34; -37, 20],
          string="V",
          style(color=9)),
        Polygon(points=[-34, 49; -37, 36; -30, 36; -34, 49], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, 1; -37, 14; -31, 14; -34, 1; -34, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[80, 51; 80, 0; 90, -1], style(color=0, thickness=2)),
        Polygon(points=[-19, 69; -10, 71; -10, 67; -19, 69], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[21, 69; 13, 71; 13, 67; 21, 69], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-19, 83; -10, 85; -10, 81; -19, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[41, 83; 33, 85; 33, 81; 41, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-78, 103; -24, 89],
          string="v = p.v - n.v",
          style(color=9))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.4,
        y=0.23,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end PulseVoltage;

  model SawToothVoltage "Saw tooth voltage source"
    parameter SI.Voltage V=1 "Amplitude of saw tooth";
    parameter SI.Time period=1 "Time for one period";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.SawTooth
        signalSource(
          amplitude=V, period=period));
    annotation (
      Icon(Line(points=[-85,-70; -65,-70; -5,71; -5,-70; 55,71; 55,-70],
            style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, -19; -37, -32; -30, -32; -34, -19], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-34, -20; -34, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-34, -70; -37, -57; -31, -57; -34, -70; -34, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-78, -24; -35, -36],
          string="offset",
          style(color=9)),
        Text(
          extent=[-31, -69; 15, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-10, -20; -10, -70], style(color=8, pattern=2)),
        Line(points=[-10, 88; -10, -20], style(color=8, pattern=2)),
        Line(points=[30, 88; 30, 59], style(color=8, pattern=2)),
        Line(points=[-10, 83; 30, 83], style(color=8)),
        Text(
          extent=[-12, 97; 34, 85],
          string="period",
          style(color=9)),
        Line(points=[-44, 60; 30, 60], style(color=8, pattern=2)),
        Line(points=[-34, 47; -34, -7], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-78, 34; -37, 20],
          string="V",
          style(color=9)),
        Polygon(points=[-34, 60; -37, 47; -30, 47; -34, 60], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, -20; -37, -7; -31, -7; -34, -20; -34, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-10, 83; -1, 85; -1, 81; -10, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[30, 83; 22, 85; 22, 81; 30, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-80, -20; -10, -20; 30, 60; 30, -20; 72, 60; 72, -20],
            style(color=0, thickness=2)),
        Text(
          extent=[-77, 100; -27, 88],
          string="v = p.v - n.v",
          style(color=9))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.37,
        y=0.04,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end SawToothVoltage;

  model TrapezoidVoltage "Trapezoidal voltage source"
    parameter SI.Voltage V=1 "Amplitude of trapezoid";
    parameter SI.Time rising(final min=0) = 0 "Rising duration of trapezoid";
    parameter SI.Time width(final min=0) = 0.5 "Width duration of trapezoid";
    parameter SI.Time falling(final min=0) = 0 "Falling duration of trapezoid";
    parameter SI.Time period(final min=Modelica.Constants.small) = 1
      "Time for one period";
    parameter Integer nperiod=-1
      "Number of periods (< 0 means infinite number of periods)";
    extends Interfaces.VoltageSource(redeclare
        Modelica.Blocks.Sources.Trapezoid signalSource(
        amplitude=V,
        rising=rising,
        width=width,
        falling=falling,
        period=period,
        nperiod=nperiod));
    annotation (
      Icon(Line(points=[-81, -70; -60, -70; -30, 70; 1, 70; 30, -70; 51, -70;
              80, 70], style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-45, -30; -47, -41; -43, -41; -45, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-45, -31; -45, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-45, -70; -47, -60; -43, -60; -45, -70; -45, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-86, -43; -43, -55],
          string="offset",
          style(color=9)),
        Text(
          extent=[-47, -69; -1, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-30, 81; -30, -70], style(color=8, pattern=2)),
        Line(points=[-10, 59; -10, 40], style(color=8, pattern=2)),
        Line(points=[20, 59; 20, 39], style(color=9, pattern=2)),
        Line(points=[40, 59; 40, -30], style(color=8, pattern=2)),
        Line(points=[-29, 56; 40, 56], style(color=8)),
        Text(
          extent=[-8, 70; 21, 60],
          string="width",
          style(color=9)),
        Line(points=[-42, 40; -10, 40], style(color=8, pattern=2)),
        Line(points=[-39, 40; -39, -19], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-77, 14; -40, 0],
          string="V",
          style(color=9)),
        Polygon(points=[-29, 56; -22, 58; -22, 54; -29, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-10, 56; -17, 58; -17, 54; -10, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-80, -30; -30, -30; -9, 46; 21, 46; 40, -30; 60, -30; 80,
              46; 100, 46], style(color=0, thickness=2)),
        Polygon(points=[-39, 40; -41, 29; -37, 29; -39, 40], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-39, -29; -41, -19; -37, -19; -39, -29; -39, -29],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[60, 81; 60, -30], style(color=8, pattern=2)),
        Polygon(points=[39, 56; 32, 58; 32, 54; 39, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[20, 56; 27, 58; 27, 54; 20, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[20, 56; 13, 58; 13, 54; 20, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-12, 56; -5, 58; -5, 54; -12, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-34, 70; -5, 60],
          string="rising",
          style(color=9)),
        Text(
          extent=[16, 70; 45, 60],
          string="falling",
          style(color=9)),
        Text(
          extent=[-77, 103; -23, 91],
          string="v = p.v - n.v",
          style(color=9)),
        Line(points=[-20, 76; 61, 76], style(color=8)),
        Polygon(points=[-29, 76; -20, 78; -20, 74; -29, 76], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[61, 76; 53, 78; 53, 74; 61, 76], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-2, 86; 25, 77],
          string="period",
          style(color=9))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.21,
        y=0.22,
        width=0.6,
        height=0.63),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TrapezoidVoltage;

  model TableVoltage "Voltage source by linear interpolation in a table"
    parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
      "Table matrix (time = first column, voltage = second column)";
    extends Interfaces.VoltageSource(redeclare
        Modelica.Blocks.Sources.TimeTable signalSource(                                       table=
           table));
    annotation (
      Icon(Line(points=[-58,-36; -58,84; 42,84; 42,-36; -58,-36; -58,-6; 42,-6;
              42,24; -58,24; -58,54; 42,54; 42,84; -8,84; -8,-37],
                   style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.25,
        y=0.01,
        width=0.72,
        height=0.86),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Rectangle(extent=[-20, 90; 30, -30], style(
            color=7,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-20, -30; -20, 90; 80, 90; 80, -30; -20, -30; -20, 0; 80,
              0; 80, 30; -20, 30; -20, 60; 80, 60; 80, 90; 30, 90; 30, -31],
            style(color=0)),
        Text(
          extent=[-77, -42; -38, -58],
          string="offset",
          style(color=9)),
        Polygon(points=[-31, -30; -33, -40; -28, -40; -31, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-30, -70; -33, -60; -28, -60; -30, -70; -30, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-31, -31; -31, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Line(points=[-20, -20; -20, -70], style(color=8, pattern=2)),
        Text(
          extent=[-38, -70; 8, -88],
          string="startTime",
          style(color=9)),
        Line(points=[-20, -30; -80, -30], style(color=8, pattern=2)),
        Text(
          extent=[66, -81; 91, -93],
          string="time",
          style(color=9)),
        Text(
          extent=[-15, 83; 24, 68],
          string="time",
          style(color=0)),
        Text(
          extent=[33, 83; 76, 67],
          string="v",
          style(color=0)),
        Text(
          extent=[-81, 98; -31, 85],
          string="v = p.v - n.v",
          style(color=9))),
      Documentation(info="<HTML>
<p>
This block generates a voltage source by <b>linear interpolation</b> in
a table. The time points and voltage values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the voltage to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the voltage value is just returned independantly of the
    actual time instant, i.e., this is a constant voltage source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the voltage.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the voltage v =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the voltage v =  2.5,
    e.g., time = 2.0, the voltage v =  4.0,
    e.g., time = 5.0, the voltage v = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TableVoltage;

  model SignalCurrent
    "Generic current source using the input signal as source current"

    Interfaces.PositivePin p annotation (extent=[-110, -10; -90, 10]);
    Interfaces.NegativePin n annotation (extent=[110, -10; 90, 10]);
    SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
    Modelica.Blocks.Interfaces.RealInput i(
        redeclare type SignalType = SI.Current)
      "Current flowing from pin p to pin n as input signal"
       annotation (extent=[-20, 50; 20, 90], rotation=-90);

    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-90, 0; -50, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50, 0; 90, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, -50; 0, 50], style(color=0, rgbcolor={0,0,0})),
        Text(extent=[-100, -120; 100, -80], string="%name"),
        Polygon(points=[90,0; 60,10; 60,-10; 90,0],      style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=3,
            rgbfillColor={0,0,255}))),
      Window(
        x=0.39,
        y=0.19,
        width=0.6,
        height=0.6),
      Diagram(
        Ellipse(extent=[-50,50; 50,-50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-96,0; -50,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50,0; 96,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0,-50; 0,50], style(color=0, rgbcolor={0,0,0}))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
  equation
    v = p.v - n.v;
    0 = p.i + n.i;
    i = p.i;
  end SignalCurrent;

  model ConstantCurrent "Source for constant current"
    parameter SI.Current I=1 "Value of constant current";
    extends Interfaces.OnePort;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Icon(
        Ellipse(extent=[-50, 50; 50, -50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-90, 0; -50, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50, 0; 90, 0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0, -50; 0, 50], style(color=0, rgbcolor={0,0,0})),
        Text(extent=[-100,80; 100,120],     string="%name=%I"),
        Polygon(points=[90,0; 60,10; 60,-10; 90,0],      style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=3,
            rgbfillColor={0,0,255}))),
      Window(
        x=0.33,
        y=0.24,
        width=0.6,
        height=0.6),
      Diagram(
        Ellipse(extent=[-50,50; 50,-50], style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255})),
        Line(points=[-96,0; -50,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[50,0; 96,0], style(color=0, rgbcolor={0,0,0})),
        Line(points=[0,-50; 0,50], style(color=0, rgbcolor={0,0,0}))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  equation
    i = I;
  end ConstantCurrent;

  model StepCurrent "Step current source"
    parameter SI.Current I=1 "Height of step";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Step
        signalSource(                                                                    height=I));
    annotation (
      Icon(Line(points=[-86,-70; -14,-70; -14,70; 57,70],     style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-80, -18; 0, -18; 0, 50; 80, 50], style(color=0, thickness=
               2)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
              fillColor=8)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Text(
          extent=[-21, -72; 25, -90],
          string="startTime",
          style(color=9)),
        Line(points=[0, -17; 0, -71], style(color=8, pattern=2)),
        Text(
          extent=[-68, -36; -22, -54],
          string="offset",
          style(color=9)),
        Line(points=[-13, 50; -13, -17], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[2, 50; -19, 50; 2, 50], style(color=8, pattern=2)),
        Polygon(points=[-13, -17; -16, -4; -10, -4; -13, -17; -13, -17], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-13, 50; -16, 37; -9, 37; -13, 50], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-68, 26; -22, 8],
          string="I",
          style(color=9)),
        Polygon(points=[-13, -69; -16, -56; -10, -56; -13, -69; -13, -69],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-13, -18; -13, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-13, -18; -16, -31; -9, -31; -13, -18], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.28,
        y=0,
        width=0.72,
        height=0.73),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end StepCurrent;

  model RampCurrent "Ramp current source"
    parameter SI.Current I=1 "Height of ramp";
    parameter SI.Time duration(min=Modelica.Constants.small) = 2
      "Duration of ramp";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Ramp
        signalSource(                                                                    final
          height=I, final duration=duration));
    annotation (
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-80, -20; -20, -20; 50, 50], style(color=0, thickness=2)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-40, -20; -42, -30; -37, -30; -40, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -20; -40, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-80, -33; -41, -49],
          string="offset",
          style(color=9)),
        Text(
          extent=[-40, -70; 6, -88],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-20, -20; -20, -70], style(color=8, pattern=2)),
        Line(points=[-19, -20; 50, -20], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Line(points=[50, 50; 101, 50], style(color=0, thickness=2)),
        Line(points=[50, 50; 50, -20], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[50, -20; 42, -18; 42, -22; 50, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-20, -20; -11, -18; -11, -22; -20, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[50, 50; 48, 40; 53, 40; 50, 50], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[50, -20; 47, -10; 52, -10; 50, -20; 50, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[53, 25; 82, 7],
          string="I",
          style(color=9)),
        Text(
          extent=[0, -17; 35, -37],
          string="duration",
          style(color=9)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Icon(Line(points=[-80, -60; -50, -60; 50, 60; 80, 60], style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.29,
        y=0.11,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end RampCurrent;

  model SineCurrent "Sine current source"
    parameter SI.Current I=1 "Amplitude of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Frequency freqHz=1 "Frequency of sine wave";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Sine
        signalSource(
        amplitude=I,
        freqHz=freqHz,
        phase=phase));
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.37,
        y=0.06,
        width=0.6,
        height=0.6),
      Icon(Line(points=[-70, 0; -60.2, 29.9; -53.8, 46.5; -48.2, 58.1; -43.3,
              65.2; -38.3, 69.2; -33.4, 69.8; -28.5, 67; -23.6, 61; -18.6, 52;
              -13, 38.6; -5.98, 18.6; 8.79, -26.9; 15.1, -44; 20.8, -56.2; 25.7,
                -64; 30.6, -68.6; 35.5, -70; 40.5, -67.9; 45.4, -62.5; 50.3, -
              54.1; 55.9, -41.3; 63, -21.7; 70, 0], style(color=8))),
      Diagram(
        Line(points=[-80, -90; -80, 84], style(color=8)),
        Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
              fillColor=8)),
        Line(points=[-99, -40; 85, -40], style(color=8)),
        Polygon(points=[101, -40; 85, -34; 85, -46; 101, -40], style(color=8,
              fillColor=8)),
        Line(points=[-40, 0; -31.6, 34.2; -26.1, 53.1; -21.3, 66.4; -17.1, 74.6;
                -12.9, 79.1; -8.64, 79.8; -4.42, 76.6; -0.201, 69.7; 4.02, 59.4;
                8.84, 44.1; 14.9, 21.2; 27.5, -30.8; 33, -50.2; 37.8, -64.2; 42,
                -73.1; 46.2, -78.4; 50.5, -80; 54.7, -77.6; 58.9, -71.5; 63.1,
              -61.9; 67.9, -47.2; 74, -24.8; 80, 0], style(color=0, thickness=2)),
        Line(points=[-41, -2; -80, -2], style(color=0, thickness=2)),
        Text(
          extent=[-106, -11; -60, -29],
          string="offset",
          style(color=9)),
        Line(points=[-41, -2; -41, -40], style(color=8, pattern=2)),
        Text(
          extent=[-60, -43; -14, -61],
          string="startTime",
          style(color=9)),
        Text(
          extent=[84, -52; 108, -72],
          string="time",
          style(color=9)),
        Line(points=[-9, 79; 43, 79], style(color=8, pattern=2)),
        Line(points=[-42, -1; 50, 0], style(color=8, pattern=2)),
        Polygon(points=[33, 80; 30, 67; 37, 67; 33, 80], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[37, 57; 83, 39],
          string="I",
          style(color=9)),
        Polygon(points=[33, 1; 30, 14; 36, 14; 33, 1; 33, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[33, 79; 33, 0], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-73, 82; -53, 102],
          string="i",
          style(color=8))),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end SineCurrent;

  model ExpSineCurrent "Exponentially damped sine current source"
    parameter Real I=1 "Amplitude of sine wave";
    parameter SI.Frequency freqHz=2 "Frequency of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Damping damping=1 "Damping coefficient of sine wave";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.ExpSine
        signalSource(
        amplitude=I,
        freqHz=freqHz,
        phase=phase,
        damping=damping));
    annotation (
      Icon(Line(points=[-80, -14; -75.2, 18.3; -72, 36.3; -68.7, 50.5; -65.5,
              60.2; -62.3, 65.3; -59.1, 65.6; -55.9, 61.3; -52.7, 53.1; -48.6,
              38.2; -43, 11.8; -35, -27.9; -30.2, -47.7; -26.1, -59.9; -22.1, -
              67.2; -18.1, -69.3; -14.1, -66.5; -10.1, -59.3; -5.23, -46.1;
              8.44, -0.3; 13.3, 12.4; 18.1, 20.8; 22.1, 24; 26.9, 23.2; 31.8,
              17.8; 38.2, 5.4; 51.1, -24.5; 57.5, -35.2; 63.1, -39.9; 68.7, -
              39.9; 75.2, -34.5; 80, -27.8], style(color=8))),
      Diagram(
        Line(points=[-80, -90; -80, 84], style(color=8)),
        Polygon(points=[-80, 100; -86, 84; -74, 84; -80, 100], style(color=8,
              fillColor=8)),
        Line(points=[-99, -40; 85, -40], style(color=8)),
        Polygon(points=[101, -40; 85, -34; 85, -46; 101, -40], style(color=8,
              fillColor=8)),
        Line(points=[-50, 0; -46.1, 28.2; -43.5, 44; -40.9, 56.4; -38.2, 64.9;
              -35.6, 69.4; -33, 69.6; -30.4, 65.9; -27.8, 58.7; -24.5, 45.7; -
              19.9, 22.5; -13.4, -12.2; -9.5, -29.5; -6.23, -40.1; -2.96, -46.5;
                0.302, -48.4; 3.57, -45.9; 6.83, -39.6; 10.8, -28.1; 21.9, 12;
              25.8, 23.1; 29.7, 30.5; 33, 33.3; 36.9, 32.5; 40.8, 27.8; 46,
              16.9; 56.5, -9.2; 61.7, -18.6; 66.3, -22.7; 70.9, -22.6; 76.1, -
              18; 80, -12.1], style(color=0, thickness=2)),
        Text(
          extent=[-78, 1; -55, -19],
          string="offset",
          style(color=9)),
        Text(
          extent=[-72, -36; -26, -54],
          string="startTime",
          style(color=9)),
        Text(
          extent=[84, -52; 108, -72],
          string="time",
          style(color=9)),
        Line(points=[-50, 0; 18, 0], style(color=8, pattern=2)),
        Line(points=[-50, 0; -81, 0], style(color=0, thickness=2)),
        Line(points=[-50, 77; -50, 0], style(color=8, pattern=2)),
        Line(points=[18, -1; 18, 76], style(color=8, pattern=2)),
        Line(points=[18, 73; -50, 73], style(color=8)),
        Text(
          extent=[-42, 88; 9, 74],
          string="1/freqHz",
          style(color=9)),
        Polygon(points=[-49, 73; -40, 75; -40, 71; -49, 73], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[18, 73; 10, 75; 10, 71; 18, 73], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-50, -61; -19, -61], style(color=8)),
        Polygon(points=[-18, -61; -26, -59; -26, -63; -18, -61], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-51, -63; -27, -75],
          string="t",
          style(color=9)),
        Text(
          extent=[-82, -67; 108, -96],
          string="I*exp(-damping*t)*sin(2*pi*freqHz*t+phase)",
          style(color=9)),
        Line(points=[-50, 0; -50, -40], style(color=8, pattern=2)),
        Line(points=[-50, -54; -50, -72], style(color=8, pattern=2)),
        Line(points=[18, -76; -1, -48], style(color=8, pattern=2)),
        Text(
          extent=[-74, 83; -54, 103],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.33,
        y=0.06,
        width=0.6,
        height=0.75),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end ExpSineCurrent;

  model ExponentialsCurrent " Rising and falling exponential current source"
    parameter Real iMax=1 "Upper bound for rising edge";
    parameter SI.Time riseTime(min=0) = 0.5 "Rise time";
    parameter SI.Time riseTimeConst(min=Modelica.Constants.small) = 0.1
      "Rise time constant";
    parameter SI.Time fallTimeConst(min=Modelica.Constants.small) = riseTimeConst
      "Fall time constant";
    extends Interfaces.CurrentSource(redeclare
        Modelica.Blocks.Sources.Exponentials signalSource(
        outMax=iMax,
        riseTime=riseTime,
        riseTimeConst=riseTimeConst,
        fallTimeConst=fallTimeConst));
    annotation (
      Icon(Line(points=[-76, -59; -73.2, -44.3; -70.3, -31.1; -66.8, -16.6; -
              63.3, -4; -59.7, 6.92; -55.5, 18.18; -51.3, 27.7; -46.3, 37; -
              40.6, 45.5; -34.3, 53.1; -27.2, 59.6; -18.7, 65.3; -8.1, 70.2; -6,
                71; -3.88, 58.5; -1.05, 43.7; 1.78, 30.8; 4.606, 19.45; 8.14,
              7.3; 11.68, -3; 15.9, -13.2; 20.2, -21.6; 25.1, -29.5; 30.8, -
              36.4; 37.1, -42.3; 44.9, -47.5; 54.8, -51.8; 64, -54.4], style(
              color=8))),
      Diagram(
        Line(points=[-100, -70; 84, -70], style(color=8)),
        Polygon(points=[100, -70; 84, -64; 84, -76; 100, -70], style(color=8,
              fillColor=8)),
        Line(points=[-40, -30; -37.2, -15.3; -34.3, -2.1; -30.8, 12.4; -27.3,
              25; -23.7, 35.92; -19.5, 47.18; -15.3, 56.7; -10.3, 66; -4.6,
              74.5; 1.7, 82.1; 8.8, 88.6; 17.3, 94.3; 27.9, 99.2; 30, 100;
              32.12, 87.5; 34.95, 72.7; 37.78, 59.8; 40.606, 48.45; 44.14, 36.3;
                47.68, 26; 51.9, 15.8; 56.2, 7.4; 61.1, -0.5; 66.8, -7.4; 73.1,
                -13.3; 80.9, -18.5; 90.8, -22.8; 100, -25.4], style(color=0,
              thickness=2)),
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -29; -40, -60], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-40, -30; -42, -40; -37, -40; -40, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-39, -30; -80, -30], style(color=0, thickness=2)),
        Text(
          extent=[-59, -71; -13, -89],
          string="startTime",
          style(color=9)),
        Polygon(points=[-41, -30; -32, -28; -32, -32; -41, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-40, -30; 29, -30], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[29, -30; 21, -28; 21, -32; 29, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-26, -12; 19, -28],
          string="riseTime",
          style(color=9)),
        Line(points=[-39, -30; -80, -30], style(color=0, thickness=2)),
        Line(points=[30, 100; 30, -34], style(color=8, pattern=2)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.11,
        y=0.12,
        width=0.78,
        height=0.83),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end ExponentialsCurrent;

  model PulseCurrent "Pulse current source"
    parameter SI.Current I=1 "Amplitude of pulse";
    parameter Real width(
      final min=Modelica.Constants.small,
      final max=100) = 50 "Width of pulse in % of period";
    parameter SI.Time period(final min=Modelica.Constants.small) = 1
      "Time for one period";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Pulse
        signalSource(
        amplitude=I,
        width=width,
        period=period));
    annotation (
      Icon(Line(points=[-70,-67; -40,-67; -40,73; 0,73; 0,-67; 40,-67; 40,73;
              80,73],        style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, 1; -37, -12; -30, -12; -34, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-34, -1; -34, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-33, -70; -36, -57; -30, -57; -33, -70; -33, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-78, -24; -35, -36],
          string="offset",
          style(color=9)),
        Text(
          extent=[-31, -69; 15, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-10, 0; -10, -70], style(color=8, pattern=2)),
        Line(points=[-80, 0; -20, 0; -21, 50; 21, 50; 20, -1; 41, 0; 40, 50; 80,
                51], style(color=0, thickness=2)),
        Line(points=[-19, 88; -19, 49], style(color=8, pattern=2)),
        Line(points=[21, 74; 21, 50], style(color=9, pattern=2)),
        Line(points=[41, 88; 41, 50], style(color=8, pattern=2)),
        Line(points=[-19, 83; 42, 83], style(color=8)),
        Line(points=[-19, 69; 21, 69], style(color=8)),
        Text(
          extent=[-9, 97; 37, 85],
          string="period",
          style(color=9)),
        Text(
          extent=[-18, 81; 21, 69],
          string="width",
          style(color=9)),
        Line(points=[-52, 50; -19, 50], style(color=8, pattern=2)),
        Line(points=[-34, 50; -34, 1], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-78, 34; -37, 20],
          string="I",
          style(color=9)),
        Polygon(points=[-34, 49; -37, 36; -30, 36; -34, 49], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, 1; -37, 14; -31, 14; -34, 1; -34, 1], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[80, 51; 80, 0; 90, -1], style(color=0, thickness=2)),
        Polygon(points=[-19, 69; -10, 71; -10, 67; -19, 69], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[21, 69; 13, 71; 13, 67; 21, 69], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-19, 83; -10, 85; -10, 81; -19, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[41, 83; 33, 85; 33, 81; 41, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.4,
        y=0.23,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end PulseCurrent;

  model SawToothCurrent "Saw tooth current source"
    parameter SI.Current I=1 "Amplitude of saw tooth";
    parameter SI.Time period=1 "Time for one period";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.SawTooth
        signalSource(
          amplitude=I, period=period));
    annotation (
      Icon(Line(points=[-70, -71; -50, -71; 10, 70; 10, -71; 70, 70; 70, -71],
            style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, -19; -37, -32; -30, -32; -34, -19], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-34, -20; -34, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-34, -70; -37, -57; -31, -57; -34, -70; -34, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-78, -24; -35, -36],
          string="offset",
          style(color=9)),
        Text(
          extent=[-31, -69; 15, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-10, -20; -10, -70], style(color=8, pattern=2)),
        Line(points=[-10, 88; -10, -20], style(color=8, pattern=2)),
        Line(points=[30, 88; 30, 59], style(color=8, pattern=2)),
        Line(points=[-10, 83; 30, 83], style(color=8)),
        Text(
          extent=[-12, 97; 34, 85],
          string="period",
          style(color=9)),
        Line(points=[-44, 60; 30, 60], style(color=8, pattern=2)),
        Line(points=[-34, 47; -34, -7], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-78, 34; -37, 20],
          string="I",
          style(color=9)),
        Polygon(points=[-34, 60; -37, 47; -30, 47; -34, 60], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-34, -20; -37, -7; -31, -7; -34, -20; -34, -20], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-10, 83; -1, 85; -1, 81; -10, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[30, 83; 22, 85; 22, 81; 30, 83], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-80, -20; -10, -20; 30, 60; 30, -20; 72, 60; 72, -20],
            style(color=0, thickness=2)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.37,
        y=0.04,
        width=0.6,
        height=0.6),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end SawToothCurrent;

  model TrapezoidCurrent "Trapezoidal current source"
    parameter SI.Current I=1 "Amplitude of trapezoid";
    parameter SI.Time rising(final min=0) = 0 "Rising duration of trapezoid";
    parameter SI.Time width(final min=0) = 0.5 "Width duration of trapezoid";
    parameter SI.Time falling(final min=0) = 0 "Falling duration of trapezoid";
    parameter SI.Time period(final min=Modelica.Constants.small) = 1
      "Time for one period";
    parameter Integer nperiod=-1
      "Number of periods (< 0 means infinite number of periods)";
    extends Interfaces.CurrentSource(redeclare
        Modelica.Blocks.Sources.Trapezoid signalSource(
        amplitude=I,
        rising=rising,
        width=width,
        falling=falling,
        period=period,
        nperiod=nperiod));
    annotation (
      Icon(Line(points=[-81,-66; -60,-66; -30,74; 1,74; 30,-66; 51,-66; 80,74],
                       style(color=8))),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-45, -30; -47, -41; -43, -41; -45, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-45, -31; -45, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Polygon(points=[-45, -70; -47, -60; -43, -60; -45, -70; -45, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-86, -43; -43, -55],
          string="offset",
          style(color=9)),
        Text(
          extent=[-47, -69; -1, -87],
          string="startTime",
          style(color=9)),
        Text(
          extent=[70, -80; 94, -100],
          string="time",
          style(color=9)),
        Line(points=[-29, 79; -30, -70], style(color=8, pattern=2)),
        Line(points=[-10, 59; -10, 40], style(color=8, pattern=2)),
        Line(points=[20, 59; 20, 39], style(color=9, pattern=2)),
        Line(points=[40, 59; 40, -30], style(color=8, pattern=2)),
        Line(points=[-20, 75; 60, 75], style(color=8)),
        Line(points=[-29, 56; 40, 56], style(color=8)),
        Text(
          extent=[-9, 88; 37, 76],
          string="period",
          style(color=9)),
        Text(
          extent=[-8, 70; 21, 60],
          string="width",
          style(color=9)),
        Line(points=[-42, 40; -10, 40], style(color=8, pattern=2)),
        Line(points=[-39, 40; -39, -19], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Text(
          extent=[-77, 14; -40, 0],
          string="I",
          style(color=9)),
        Polygon(points=[-29, 56; -22, 58; -22, 54; -29, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-10, 56; -17, 58; -17, 54; -10, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-29, 75; -20, 77; -20, 73; -29, 75], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[60, 75; 52, 77; 52, 73; 60, 75], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-80, -30; -30, -30; -9, 46; 21, 46; 40, -30; 60, -30; 80,
              46; 100, 46], style(color=0, thickness=2)),
        Polygon(points=[-39, 40; -41, 29; -37, 29; -39, 40], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-39, -29; -41, -19; -37, -19; -39, -29; -39, -29],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[60, 80; 60, -30], style(color=8, pattern=2)),
        Polygon(points=[39, 56; 32, 58; 32, 54; 39, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[20, 56; 27, 58; 27, 54; 20, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[20, 56; 13, 58; 13, 54; 20, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-12, 56; -5, 58; -5, 54; -12, 56], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Text(
          extent=[-34, 70; -5, 60],
          string="rising",
          style(color=9)),
        Text(
          extent=[16, 70; 45, 60],
          string="falling",
          style(color=9)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.19,
        y=0.28,
        width=0.6,
        height=0.63),
      Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TrapezoidCurrent;

  model TableCurrent "Current source by linear interpolation in a table"
    parameter Real table[:, :]=[0, 0; 1, 1; 2, 4]
      "Table matrix (time = first column, current = second column)";
    extends Interfaces.CurrentSource(redeclare
        Modelica.Blocks.Sources.TimeTable signalSource(                                       table=
           table));
    annotation (
      Icon(Line(points=[-66, -36; -66, 84; 34, 84; 34, -36; -66, -36; -66, -6;
              34, -6; 34, 24; -66, 24; -66, 54; 34, 54; 34, 84; -16, 84; -16, -
              37], style(color=8))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.25,
        y=0.01,
        width=0.72,
        height=0.86),
      Diagram(
        Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
              fillColor=8)),
        Line(points=[-80, 68; -80, -80], style(color=8)),
        Line(points=[-90, -70; 82, -70], style(color=8)),
        Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Rectangle(extent=[-20, 90; 30, -30], style(
            color=7,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-20, -30; -20, 90; 80, 90; 80, -30; -20, -30; -20, 0; 80,
              0; 80, 30; -20, 30; -20, 60; 80, 60; 80, 90; 30, 90; 30, -31],
            style(color=0)),
        Text(
          extent=[-77, -42; -38, -58],
          string="offset",
          style(color=9)),
        Polygon(points=[-31, -30; -33, -40; -28, -40; -31, -30], style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Polygon(points=[-30, -70; -33, -60; -28, -60; -30, -70; -30, -70],
            style(
            color=8,
            fillColor=8,
            fillPattern=1)),
        Line(points=[-31, -31; -31, -70], style(
            color=8,
            pattern=1,
            thickness=1,
            arrow=0)),
        Line(points=[-20, -20; -20, -70], style(color=8, pattern=2)),
        Text(
          extent=[-38, -70; 8, -88],
          string="startTime",
          style(color=9)),
        Line(points=[-20, -30; -80, -30], style(color=8, pattern=2)),
        Text(
          extent=[66, -81; 91, -93],
          string="time",
          style(color=9)),
        Text(
          extent=[-15, 83; 24, 68],
          string="time",
          style(color=0)),
        Text(
          extent=[33, 83; 76, 67],
          string="v",
          style(color=0)),
        Text(
          extent=[-73, 75; -53, 95],
          string="i",
          style(color=8))),
      Documentation(info="<HTML>
<p>
This block generates a current source by <b>linear interpolation</b> in
a table. The time points and current values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the current to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the current value is just returned independantly of the
    actual time instant, i.e., this is a constant current source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the current.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]
If, e.g., time = 1.0, the current i =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the current i =  2.5,
    e.g., time = 2.0, the current i =  4.0,
    e.g., time = 5.0, the current i = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TableCurrent;

end Sources;
