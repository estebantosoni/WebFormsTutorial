using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectFees
{
    public class States
    {
        public List<StateFee> ServiceAreaStateFees = new List<StateFee>();

        public decimal OutOfAreaFee { get; private set; }

        public States()
        {
            ServiceAreaStateFees.Add(new StateFee("Alabama", "AL", 8.99m));
            ServiceAreaStateFees.Add(new StateFee("Alaska", "AK", 2.99m));
            ServiceAreaStateFees.Add(new StateFee("Arizona", "AZ", 16.99m));
            ServiceAreaStateFees.Add(new StateFee("Arkansas", "AR", 3.99m));
            ServiceAreaStateFees.Add(new StateFee("California", "CA", 5.99m));
            ServiceAreaStateFees.Add(new StateFee("Colorado", "CO", 2.99m));

            OutOfAreaFee = 49.99m;
        }

        public decimal GetFeeForState(string twoLetterCode)
        {
            var state = ServiceAreaStateFees.FirstOrDefault(s => s.TwoLetterCode.Equals(twoLetterCode.ToUpper()));
            
            return state != null ? state.Fee : OutOfAreaFee;
        }
    }
}
