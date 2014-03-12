using System;
using RulesMVC.Models;

namespace RulesMVC.DAL
{
    public class UnitOfWork : IDisposable
    {
        private TestContext context = new TestContext();
        private GenericRepository<Application> applicationRepository;
        private GenericRepository<Rule> ruleRepository;
        private GenericRepository<Price> priceRepository;
        private GenericRepository<SMSGateway> smsGatewayRepository;

        public GenericRepository<Application> ApplicationRepository
        {
            get
            {

                if (this.applicationRepository == null)
                {
                    this.applicationRepository = new GenericRepository<Application>(context);
                }
                return applicationRepository;
            }
        }

        public GenericRepository<Rule> RuleRepository
        {
            get
            {

                if (this.ruleRepository == null)
                {
                    this.ruleRepository = new GenericRepository<Rule>(context);
                }
                return this.ruleRepository;
            }
        }

        public GenericRepository<Price> PriceRepository
        {
            get
            {

                if (this.priceRepository == null)
                {
                    this.priceRepository = new GenericRepository<Price>(context);
                }
                return this.priceRepository;
            }
        }

        public GenericRepository<SMSGateway> SmsGatewayRepository
        {
            get
            {

                if (this.smsGatewayRepository == null)
                {
                    this.smsGatewayRepository = new GenericRepository<SMSGateway>(context);
                }
                return this.smsGatewayRepository;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}