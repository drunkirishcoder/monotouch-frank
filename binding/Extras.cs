using System;
using System.Diagnostics;

namespace MonoTouch.FrankAutomation
{
	[Conditional("ACCEPTANCE")]
	[AttributeUsage(AttributeTargets.Assembly)]
	public class FrankifyAttribute : Attribute
	{
	}
}
