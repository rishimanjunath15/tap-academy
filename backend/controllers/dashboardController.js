const LeaveRequest = require('../models/LeaveRequest');
const User = require('../models/User');

exports.getDashboardStats = async (req, res) => {
  try {
    const totalEmployees = await User.countDocuments({ role: 'employee' });
    const pendingRequests = await LeaveRequest.countDocuments({ status: 'pending' });
    const approvedRequests = await LeaveRequest.countDocuments({ status: 'approved' });
    const rejectedRequests = await LeaveRequest.countDocuments({ status: 'rejected' });

    res.json({
      totalEmployees,
      pendingRequests,
      approvedRequests,
      rejectedRequests
    });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};
