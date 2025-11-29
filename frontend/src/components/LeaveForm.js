import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { applyLeave } from '../redux/slices/leaveSlice';
import './LeaveForm.css';

const LeaveForm = () => {
  const [formData, setFormData] = useState({
    leaveType: 'annual',
    startDate: '',
    endDate: '',
    reason: ''
  });
  const dispatch = useDispatch();
  const { loading } = useSelector((state) => state.leaves);

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await dispatch(applyLeave(formData)).unwrap();
      setFormData({
        leaveType: 'annual',
        startDate: '',
        endDate: '',
        reason: ''
      });
      alert('Leave request submitted successfully!');
    } catch (err) {
      alert('Failed to submit leave request: ' + err.message);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="leave-form">
      <div className="form-row">
        <div className="form-group">
          <label>Leave Type</label>
          <select name="leaveType" value={formData.leaveType} onChange={handleChange} required>
            <option value="annual">Annual Leave</option>
            <option value="sick">Sick Leave</option>
            <option value="casual">Casual Leave</option>
          </select>
        </div>
        <div className="form-group">
          <label>Start Date</label>
          <input
            type="date"
            name="startDate"
            value={formData.startDate}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>End Date</label>
          <input
            type="date"
            name="endDate"
            value={formData.endDate}
            onChange={handleChange}
            required
          />
        </div>
      </div>
      <div className="form-group">
        <label>Reason</label>
        <textarea
          name="reason"
          value={formData.reason}
          onChange={handleChange}
          required
          rows="4"
          placeholder="Please provide a reason for your leave request..."
        />
      </div>
      <button type="submit" disabled={loading} className="btn-submit">
        {loading ? 'Submitting...' : 'Submit Leave Request'}
      </button>
    </form>
  );
};

export default LeaveForm;
